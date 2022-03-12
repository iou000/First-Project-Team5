package com.team5.controller.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;

/**
 * @author    : seop
 * @Date      : 2022. 3. 10.
 * @ClassName : RecipeCreateAction
 * @Comment   : 레시피 생성 Action
 */
public class RecipeInsertAction implements Action {
	private static final String RECIPE_IMAGE_REPO = "C:\\Users\\SJH\\eclipse-workspace\\RecipeApplication\\WebContent\\images\\recipe";
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "app?command=mainpage";
		//HttpSession session = request.getSession();
		//UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		Map<String, String> map = upload(request, response);
		
		RecipeVO recipeVO = new RecipeVO();
		/*recipeVO.setTitle(map.get("title"));
		recipeVO.setIntro(map.get("intro"));
		recipeVO.setCategory(map.get("category"));
		recipeVO.setIngredients(map.get("ingredients"));
		recipeVO.setDetails(map.get("details"));
		
		String imageFileName = map.get("image");
		recipeVO.setImage(imageFileName);*/
		
		recipeVO.setTitle(request.getParameter("title"));
		recipeVO.setIntro(request.getParameter("intro").replace("\r\n","<br>"));
		recipeVO.setCategory(request.getParameter("category"));
		recipeVO.setIngredients(request.getParameter("ingredients"));
		recipeVO.setDetails(request.getParameter("details").replace("\r\n","<br>"));
		recipeVO.setImage(request.getParameter("image"));
		recipeVO.setUser_id(1);
		
		System.out.println(recipeVO.getImage());
		
		RecipeDAO recipeDAO = RecipeDAO.getInstance();
		recipeDAO.insertRecipe(recipeVO);
		System.out.println(recipeVO.getTitle());
		
	    response.sendRedirect(url);
	}
	
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> map = new HashMap<>();
		File currendDirPath = new File(RECIPE_IMAGE_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currendDirPath);
		factory.setSizeThreshold(1024*1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> items = upload.parseRequest(request);
			for(FileItem item : items) {
				if(item.getSize() > 0) {
					String separator = File.separator;
					int idx = item.getName().lastIndexOf(separator);
					String fileName = item.getName().substring(idx+1);
					File uploadFile = new File(currendDirPath + separator + fileName);
					item.write(uploadFile);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
