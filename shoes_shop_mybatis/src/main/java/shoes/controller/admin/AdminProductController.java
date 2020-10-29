package shoes.controller.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.Pagination;
import shoes.dto.ProductDTO;
import shoes.service.FileUploadService;
import shoes.service.ProductService;
import shoes.service.SearchService;

@Controller
public class AdminProductController {
	@Autowired
	ProductService productService;
	@Autowired
	FileUploadService fileUploadService;
	@Autowired
	SearchService search;

	// 상품 리스트로 이동
	@RequestMapping("/ProductList")
	public String productlist(@RequestParam(defaultValue = "1") int curPage, Model model, HttpServletRequest request) {
		System.out.println("Mapping : /ProductList");
		System.out.println(request.getParameter("category"));
		int listCnt = productService.productList().size();
		
		Pagination pagination = new Pagination(listCnt, curPage);
		List<ProductDTO> list;
		
		if(request.getParameter("keyword") == null)
			list = productService.productPagination(pagination);
		else {
			String category = request.getParameter("category");
			String keyword = request.getParameter("keyword");
			list = productService.productSearchList(keyword, category);
			model.addAttribute("keyword",keyword);
		}

		model.addAttribute("list", list);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pagination);

		return "AdminPage/ProductList";
	}

	// 상품 삭제
	@RequestMapping("/ProductDelete")
	public String productDelete(@RequestParam("select") List<Integer> list, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /ProductDelete");
		for (int i = 0; i < list.size(); i++) {
			productService.productDelete(list.get(i));
		}
		System.out.println(request.getParameter("select"));
		redirectAttr.addFlashAttribute("msg", "상품을 삭제했습니다");
		return "redirect:ProductList";
	}

	// 상품추가 페이지로 이동
	@RequestMapping("/AddProduct")
	public String addproduct() {
		System.out.println("Mapping : /AddProduct");
		return "AdminPage/ProductAdd";
	}

	// 상품 추가
	@RequestMapping("/AddProductAction")
	public String addproductAction(ProductDTO product, Model model,
								   @RequestParam("filename") MultipartFile[] file) {
		System.out.println("Mapping : /addProductAction");
		if(file.length > 5) {
			model.addAttribute("msg", "상품을 등록에 실패했습니다");
			return "AdminPage/ProductAdd";
		}

		System.out.println("파일크기"+file.length);
		String fileName[] = new String[5];
		for(int i = 0; i < file.length; i++) {
			fileName[i] = fileUploadService.restore(file[i], "newbalance", product.getCategory(), product.getName(), i+1);
			System.out.println("name:" + fileName[i]);
			//product.setImage1(saveFileName);
		}
		product.setImage1(fileName[0]);
		product.setImage2(fileName[1]);
		product.setImage3(fileName[2]);
		product.setImage4(fileName[3]);
		product.setImage5(fileName[4]);
		
		product.setReg(new Date());
		System.out.println(product.getImage2());
		productService.productInsert(product);
		model.addAttribute("msg", "상품을 등록했습니다");
		
		return "AdminPage/ProductAdd";
	}

	// 상품수정 페이지로 이동
	@RequestMapping("/ProductModify")
	public String productModify(ProductDTO product, HttpServletRequest request, Model model) {
		System.out.println("Mapping : /productModify");
		String name = request.getParameter("name");
		ProductDTO dto = productService.productSearch(name);
		model.addAttribute("data", dto);
		return "AdminPage/ProductModify";
	}

	// 상품수정
	@RequestMapping("/ProductModifyAction")
	public String productModifyAction(ProductDTO product, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /productModifyAction");
		productService.productModify(product);
		redirectAttr.addFlashAttribute("msg", "상품을 수정했습니다");
		return "redirect:ProductList";
	}

	// 상품 추가
	@RequestMapping("/Stock")
	public String Stock(ProductDTO product, HttpServletRequest request, Model model) {
		System.out.println("Mapping : /Stock");
		String name = request.getParameter("name");
		ProductDTO dto = productService.productSearch(name);
		model.addAttribute("data", dto);
		return "AdminPage/Stock";
	}

	// 상품 검색
	@RequestMapping("/ProductSearch")
	public String ProductSearch(ProductDTO product, HttpServletRequest request, Model model) {
		System.out.println("Mapping : /ProductSearch");
		String name = request.getParameter("search");
		System.out.println(name);
		List<ProductDTO> list = search.search(name);
		model.addAttribute("list", list);
		return "AdminPage/ProductList";
	}
}
