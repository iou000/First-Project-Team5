package com.team5.controller.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;

/**
 * @author    : seop
 * @Date      : 2022. 3. 11.
 * @ClassName : RecipeDeleteAction
 * @Comment   : 레시피 수정 Action
 * @author         : SJH
 * @Date            : 2022. 3. 13.
 * @ClassName : RecipeCreateAction
 * @Comment    : 이미지 파일 업로드 기능
 */
public class RecipeUpdateAction implements Action {
	private static final String RECIPE_IMAGE_REPO = "C:\\Users\\SJH\\eclipse-workspace\\RecipeApplication\\WebContent\\image\\recipe";
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "app?command=recipe_view";
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		int recipeId = Integer.parseInt(request.getParameter("recipeId"));
		
        if (loginUser == null) {
			url = "app?command=login_form";
		} else {
			Map<String, String> map = upload(request, response);
			String title = map.get("title");
			String intro = map.get("intro").replace("\r\n","<br>"); // 개행문자를 <br>로 변경 후 DB에 저장
			String category = map.get("category");
			String ingredients = map.get("ingredients");
			String details = map.get("details").replace("\r\n","<br>"); // 개행문자를 <br>로 변경 후 DB에 저장
			String image = map.get("image");
			
	        RecipeVO recipeVO = new RecipeVO();
	        recipeVO.setTitle(title);
			recipeVO.setIntro(intro);
			recipeVO.setCategory(category);
			recipeVO.setIngredients(ingredients);
			recipeVO.setDetails(details);
			recipeVO.setImage(image);
			recipeVO.setUser_id(loginUser.getId());
	        
			RecipeDAO recipeDAO = RecipeDAO.getInstance();
			recipeDAO.updateRecipe(recipeId, recipeVO); // 레시피 업데이트
			url += "&recipeId=" + recipeId; // 수정한 레시피 상세보기 페이지로 이동하기 위한 url 설정
		}
        response.sendRedirect(url);
	}
	
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> insertFormMap = new HashMap<>();
		File currentDirPath = new File(RECIPE_IMAGE_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath); // 파일이 저장되는 경로를 설정
		factory.setSizeThreshold(1024*1024); // 파일의 최대 크기를 설정
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> items = upload.parseRequest(request);
			for(FileItem item : items) {
				if(item.isFormField()) // item이 폼 필드라면 입력받아온 필드 이름과 값을 map에 삽입
					insertFormMap.put(item.getFieldName(), item.getString("utf-8"));
				else { // item이 폼 필드가 아니면 파일 업로드 기능을 수행
					if(item.getSize() > 0) {
						int idx = item.getName().lastIndexOf("\\");
						String fileName = item.getName().substring(idx+1);
						insertFormMap.put(item.getFieldName(), fileName);
						File uploadFile = new File(currentDirPath + "\\" + fileName);
						item.write(uploadFile);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertFormMap;
	}
}