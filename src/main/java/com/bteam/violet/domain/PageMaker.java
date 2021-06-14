package com.bteam.violet.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private Criteria cri;
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		// 게시글의 전체 갯수가 설정되는 시점에 메서드를 호출하여 필요한 데이터들 계산!
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public Criteria getCri() {
		return cri;
	}
	
	
	// 페이지 번호 출력 계산식 
	private void calcData() {
		// 끝 페이지 번호부터 계산!!
		// 끝페이지번호 = math.ceil(현재페이지 / 페이지 번호의 갯수) * 페이지 번호의 갯수						
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		// 시작 페이지 번호 = (끝 페이지 번호 - 페이지 번호의 갯수) + 1
		startPage = (endPage - displayPageNum) + 1;
		
		// 끝 페이지 번호 보정 계산식
		// 끝 페이지 번호 = math.ceil(전체 게시글 갯수 / 페이지 당 출력할 게시글의 갯수)
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		// 보정한 결과 값을 페이지 끝 번호 변수에 저장
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		// 시작페이지가 1인지 아니지 구별
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	//UriComponents로 URI을 동적으로 생성!
	public String makeQuery(int page) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", page)
							.queryParam("perPageNum", cri.getPerPageNum())
							.build();
		   
		return uriComponents.toUriString();
	}
	
	
	//page, perPageNum, searchType, keyword를 url로 사용
	public String makeSearch(int page)
	{

	UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
				.queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword()))
				.build();
		return uriComponents.toUriString();
	}
	
	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) {
			return "";
		}
	}
	
}
