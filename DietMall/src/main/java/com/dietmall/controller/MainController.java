package com.dietmall.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dietmall.DTO.ItemEtcBoardDTO;
import com.dietmall.DTO.ItemboardDTO;
import com.dietmall.DTO.MainDTO;
import com.dietmall.service.CategoryService;
import com.dietmall.service.MemberService;


@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	CategoryService c_service;
	
	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	// 메인 화면
	@GetMapping("/home")
	public String getMain(
			Model model,
			HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("MainController - get home");
		// 신상품
		MainDTO m_dto_new = new MainDTO();
		m_dto_new.setItem_type("new");
		m_dto_new.setSale_yn("N");
		m_dto_new.setStart(1);
		m_dto_new.setEnd(5);
		// 인기상품
		MainDTO m_dto_best = new MainDTO();
		m_dto_best.setItem_type("best");
		m_dto_best.setSale_yn("N");
		m_dto_best.setStart(1);
		m_dto_best.setEnd(5);
		// 세일상품
		MainDTO m_dto_sale = new MainDTO();
		m_dto_sale.setSale_yn("Y");
		m_dto_sale.setItem_type("none");
		m_dto_sale.setStart(1);
		m_dto_sale.setEnd(5);
		// 값 가져오기
		List<ItemboardDTO> ib_dto_new_list = new ArrayList<ItemboardDTO>();
		ib_dto_new_list = c_service.main_item_board(m_dto_new);
		List<ItemboardDTO> ib_dto_best_list = new ArrayList<ItemboardDTO>();
		ib_dto_best_list = c_service.main_item_board(m_dto_best);
		List<ItemboardDTO> ib_dto_sale_list = new ArrayList<ItemboardDTO>();
		ib_dto_sale_list = c_service.main_item_board(m_dto_sale);
		// 뷰에 값 넘기기
		model.addAttribute("ib_dto_new_list", ib_dto_new_list);
		model.addAttribute("ib_dto_best_list", ib_dto_best_list);
		model.addAttribute("ib_dto_sale_list", ib_dto_sale_list);
		return "/main/home";
	}
	
	// 메인화면 post - 로그인여부
	@PostMapping("/home")
	public void postMain(
			Model model,
			HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("MainController - post home");
	}
	
	// 신상품
	@GetMapping("/new")
	public String getNew(
			Model model,
			HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("MainController - getNew");
		MainDTO m_dto_new = new MainDTO();
		m_dto_new.setItem_type("new");
		m_dto_new.setSale_yn("N");
		m_dto_new.setStart(1);
		m_dto_new.setEnd(20);
		// 값 가져오기
		List<ItemboardDTO> ib_dto_new_list = new ArrayList<ItemboardDTO>();
		ib_dto_new_list = c_service.main_item_board(m_dto_new);
		// 뷰에 값 넘기기
		model.addAttribute("ib_dto_new_list", ib_dto_new_list);
		return "/main/new";
	}
	
	// 인기 상품
	@GetMapping("/best")
	public String getBest(
			Model model,
			HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("MainController - getBest");
		MainDTO m_dto_best = new MainDTO();
		m_dto_best.setItem_type("best");
		m_dto_best.setSale_yn("N");
		m_dto_best.setStart(1);
		m_dto_best.setEnd(20);
		// 값 가져오기
		List<ItemboardDTO> ib_dto_best_list = new ArrayList<ItemboardDTO>();
		ib_dto_best_list = c_service.main_item_board(m_dto_best);
		// 뷰에 값 넘기기
		model.addAttribute("ib_dto_best_list", ib_dto_best_list);
		return "/main/best";
	}
	
	// 세일 상품
	@GetMapping("/sale")
	public String getSale(
			Model model,
			HttpSession session, HttpServletRequest req)
			throws Exception {
		log.info("MainController - getSale");
		MainDTO m_dto_sale = new MainDTO();
		m_dto_sale.setSale_yn("Y");
		m_dto_sale.setItem_type("none");
		m_dto_sale.setStart(1);
		m_dto_sale.setEnd(20);
		// 값 가져오기
		List<ItemboardDTO> ib_dto_sale_list = new ArrayList<ItemboardDTO>();
		ib_dto_sale_list = c_service.main_item_board(m_dto_sale);
		// 뷰에 값 넘기기
		model.addAttribute("ib_dto_sale_list", ib_dto_sale_list);
		return "/main/sale";
	}
	
	// 파일 이미지 불러오기
	@GetMapping("/load-image")
	public void getLoad_proimg(
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam String fileName
			)
			throws Exception {
		log.info("MainController - getLoad_proimg");
		
		// 객체에서 정보 가져오기 (이름, 경로)
		String filePath = "C:\\dietmall_file";
		// 파일 객체 선언 (파일 경로, 파일 이름)
        File file = new File(filePath, fileName);
        int fileLength = (int)file.length();
        
        if (fileLength > 0) {
        	// 파일 학장자 체크
        	if (file.getName().endsWith(".jpg") || file.getName().endsWith(".jpeg")) {
        		response.setContentType("image/jpeg");
        		} else if (file.getName().endsWith(".png")) {
        		response.setContentType("image/png");
        		} 
        	response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
            response.setHeader("Content-Transfer-Encoding", "binary");
            response.setHeader("Content-Length", "" + fileLength);
            response.setHeader("Pragma", "no-cache;");
            response.setHeader("Expires", "-1;");
            
            // FileInputStream : 파일을 바이트 스트림으로 읽어줌
			try (FileInputStream fis = new FileInputStream(file);
					OutputStream out = response.getOutputStream();) {
				int readCount = 0;
				byte[] buffer = new byte[1024];
				// fis.read(buffer) : 파일 바이트 타입으로 읽기
				// -1 : 파일 다 읽었을 때
				// write : 읽어들인 파일의 바이트를 출력
				while ((readCount = fis.read(buffer)) != -1) {
					out.write(buffer, 0, readCount);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
	}
}
