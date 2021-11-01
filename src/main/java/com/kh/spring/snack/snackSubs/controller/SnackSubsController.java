package com.kh.spring.snack.snackSubs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SnackSubsController {

	@RequestMapping("subsForm.sn")
	public String snackSubsForm() {
		return "company/snack/snackSubsForm";
	}
}
