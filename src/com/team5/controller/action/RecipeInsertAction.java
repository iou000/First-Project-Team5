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
 * @Date : 2022. 3. 10.
 * @ClassName : RecipeInsertAction
 * @Comment : 레시피 생성 Action
 * 
 * @author : 송진호
 * @Date : 2022. 3. 13.
 * @ClassName : RecipeInsertAction
 * @Comment : 레시피 생성 액션 + 이미지 파일 업로드 기능
*/
public class RecipeInsertAction implements Action {
    //private static final String RECIPE_IMAGE_REPO = "C:\\Users\\SJH\\eclipse-workspace\\RecipeApplication\\WebContent\\images\\recipe";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "app?command=recipe_view";
        HttpSession session = request.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        String path = session.getServletContext().getRealPath("/") + "\\images\\recipe"; // 이미지가 저장되는 경로

        /* @author 송진호 */
        if (loginUser == null) {
            url = "app?command=login_form";
        } else {
            Map<String, String> map = upload(request, response, path); // upload 메소드의 결과로 Map 생성
            String title = map.get("title");
            String intro = map.get("intro");
            String category = map.get("category");
            String ingredients = map.get("ingredients").replace("\r\n", "<br>"); //개행문자를 <br>로 변경 후 DB에 저장 @김경섭
            String details = map.get("details").replace("\r\n", "<br>"); //개행문자를 <br>로 변경 후 DB에 저장 @김경섭
            String image = map.get("image");

            // RecipeVO에 포함되는 필드의 값을 초기화
            RecipeVO recipeVO = new RecipeVO();
            recipeVO.setTitle(title);
            recipeVO.setIntro(intro);
            recipeVO.setCategory(category);
            recipeVO.setIngredients(ingredients);
            recipeVO.setDetails(details);
            recipeVO.setImage(image);
            recipeVO.setUser_id(loginUser.getId());

            RecipeDAO recipeDAO = RecipeDAO.getInstance();
            int recipeId = recipeDAO.insertRecipe(recipeVO); // 레시피 생성 결과로 recipeId 반환
            url += "&recipeId=" + recipeId; // 기존 url 뒤에 recipeId 추가
        }
        response.sendRedirect(url);
        /* @author 송진호 */
    }

    /* @author 송진호 */
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
                    insertFormMap.put(item.getFieldName(), item.getString("utf-8")); // map에 키-값의 쌍으로 item.getFieldName(), item.getString("utf-8") 대입
                else { // item이 폼 필드가 아니면 파일 업로드 기능을 수행
                    if (item.getSize() > 0) {
                        int idx = item.getName().lastIndexOf("\\");
                        String fileName = item.getName().substring(idx + 1);
                        System.out.println("업로드 파일명 : " + fileName);
                        insertFormMap.put(item.getFieldName(), fileName); // map에 키-값의 쌍으로 item.getFieldName(), fileName) 대입
                        File uploadFile = new File(currentDirPath + "\\" + fileName);  // 파일 객체 생성
                        item.write(uploadFile); // 파일 업로드
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return insertFormMap;
    }
    /* @author 송진호 */
}