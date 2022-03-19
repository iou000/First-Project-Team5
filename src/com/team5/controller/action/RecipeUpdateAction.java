package com.team5.controller.action;

import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author : 김경섭
 * @Date : 2022. 3. 11.
 * @ClassName : RecipeUpdateAction
 * @Comment : 레시피 수정 Action
 * 
 * @author : 송진호
 * @Date : 2022. 3. 13.
 * @ClassName : RecipeUpdateAction
 * @Comment : 이미지 파일 업로드 기능
 */
public class RecipeUpdateAction implements Action {
    //private static final String RECIPE_IMAGE_REPO = "C:\\Users\\SJH\\eclipse-workspace\\RecipeApplication\\WebContent\\images\\recipe";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "app?command=recipe_view";
        HttpSession session = request.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        String path = session.getServletContext().getRealPath("/") + "\\images\\recipe";

        if (loginUser == null) {
            url = "app?command=login_form";
        } else {
            Map<String, String> map = upload(request, response, path);
            String title = map.get("title");
            String intro = map.get("intro");
            String category = map.get("category");
            String ingredients = map.get("ingredients").replace("\r\n", "<br>"); // 개행문자를 <br>로 변경 후 DB에 저장
            String details = map.get("details").replace("\r\n", "<br>"); // 개행문자를 <br>로 변경 후 DB에 저장
            String fileNm = map.get("fileNm");
            String image = map.get("image");
            int recipeId = Integer.parseInt(map.get("recipeId"));

            RecipeVO recipeVO = new RecipeVO();
            recipeVO.setId(recipeId);
            recipeVO.setTitle(title);
            recipeVO.setIntro(intro);
            recipeVO.setCategory(category);
            recipeVO.setIngredients(ingredients);
            recipeVO.setDetails(details);
            if (image == null) {
                recipeVO.setImage(fileNm);
            } else {
                recipeVO.setImage(image);
            }
            recipeVO.setUser_id(loginUser.getId());

            RecipeDAO recipeDAO = RecipeDAO.getInstance();
            recipeDAO.updateRecipe(recipeId, recipeVO); // 레시피 업데이트
            url += "&recipeId=" + recipeId; // 수정한 레시피 상세보기 페이지로 이동하기 위한 url 설정
        }
        response.sendRedirect(url);
    }

    private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
        Map<String, String> insertFormMap = new HashMap<>();
        File currentDirPath = new File(path);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(currentDirPath); // 파일이 저장되는 경로를 설정
        factory.setSizeThreshold(1024 * 1024); // 파일의 최대 크기를 설정

        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                if (item.isFormField()) // item이 폼 필드라면 입력받아온 필드 이름과 값을 map에 삽입
                    insertFormMap.put(item.getFieldName(), item.getString("utf-8"));
                else { // item이 폼 필드가 아니면 파일 업로드 기능을 수행
                    if (item.getSize() > 0) {
                        int idx = item.getName().lastIndexOf("\\");
                        String fileName = item.getName().substring(idx + 1);
                        System.out.println("업로드 파일명 : " + fileName);
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