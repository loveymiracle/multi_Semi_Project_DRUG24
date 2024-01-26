package com.multi.semipjt.hard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HardController {
	@RequestMapping("/news/card01")
	public String cardnews() {
		return "/hard/cardnews-1";
	}
	@RequestMapping("/news/card02")
	public String cardnews2() {
		return "/hard/cardnews-2";
	}
	@RequestMapping("/news/card03")
	public String cardnews3() {
		return "/hard/cardnews-3";
	}
	@RequestMapping("/drug/instruction")
	public String usemethod() {
		return "/hard/instruction";
	}
	@RequestMapping("/drug/safetyletter")
	public String safetyletter() {
		return "/hard/safetyletter";
	}
}
