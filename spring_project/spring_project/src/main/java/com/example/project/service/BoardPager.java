package com.example.project.service;

public class BoardPager {
	// 페이지당 게시글 수 ==> 레코드 수
	public static int PAGE_SCALE = 10; // 1-10(1페이지) ,11-20

	// 화면에 표시되는 페이스 수 (블럭)
	public static int BLOCK_SCALE = 10; // 1~10 (1블럭)

	// 페이지관련
	private int curPage;// 현재페이지수
	private int prevPage;
	private int nextPage;
	private int totPage;

	// 블럭관련
	private int curBlock;
	private int prevBlock;
	private int nextBlock;
	private int totBlock;

	// 페이지 시작 글번호, 끝번호
	private int pageBegin; // limit start=pageBegin, end = pageEnd;
	private int pageEnd;

	// 블럭 시작 번호, 끝번호
	private int blockBegin;
	private int blockEnd;

	// 생성자 ==> controller에서 사용
	public BoardPager(int count, int curPage) {
		curBlock = 1;
		this.curPage = curPage;
		setTotPage(count);// 총 갯수 --> setter에서 계산 예정
		setPageRange();// 범위 설정
		setTotBlock();// 총 클릭수 ==> setter 메서드에서 계산 예정
		setBlockRange();// 범위 설정
	}

	public void setBlockRange() {
		// 현재 속해있는 블럭계산
		curBlock = (int) Math.ceil((curPage - 1) / BLOCK_SCALE) + 1;
		// 블럭의 시작 범위
		blockBegin = (curBlock - 1) * BLOCK_SCALE + 1;

		// 블럭의 끝
		blockEnd = blockBegin + BLOCK_SCALE - 1;
		// 1-10 (block), 11~20)2block)
		
		
		if (blockEnd > totPage) {
			blockEnd = totPage;
		}
		prevPage = (curPage == 1) ? 1 : (curBlock - 1) * BLOCK_SCALE;
		
		nextPage = (curBlock > totBlock) ? (curBlock * BLOCK_SCALE) : (curBlock * BLOCK_SCALE) + 1;
		if (nextPage >= totPage) {
			nextPage = totPage;
		}

	}

	public void setPageRange() {
		pageBegin = (curPage - 1) * PAGE_SCALE + 1;
		// 2-1*10 (11~
		// 현재 페이지 3 : 3-1*10+1 (21~
		pageEnd = pageBegin + PAGE_SCALE - 1;

	}

	public static void setPageScale(int pageScale) {
		PAGE_SCALE = pageScale;
	}

	public static void setBlockScale(int blockScale) {
		BLOCK_SCALE = blockScale;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public void setTotPage(int count) {
		totPage = (int) Math.ceil(count * 1.0 / PAGE_SCALE);
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public void setTotBlock() {

		totBlock = (int) Math.ceil(totPage / BLOCK_SCALE);
		// 91/10 = > 9.1 ===> 10블럭

	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	public static int getPAGE_SCALE() {
		return PAGE_SCALE;
	}

	public static int getBLOCK_SCALE() {
		return BLOCK_SCALE;
	}

	public int getCurPage() {
		return curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	// getter/setter메서드 추가

}
