package com.jkx.web.pager;

public class web_Page {
	private int Pagecount; // 总页数
	private int Pagenow; // 当前页数
	private int Recordcount; // 总记录数
	private int Recordnow; // 当前记录数
	private int Pagesize = 5; // 每页显示的记录数量，这里默认数量为5；
	private int pagerRange = 4;// 显示固定pagerRange数量的页数框，这里默认为4；

	public int getPagenow() {
		return Pagenow;
	}

	public void setPagenow(int pagenow) {
		Pagenow = pagenow;
	}

	// public void setPagenow(int Recordnow, int Pagesize) {
	// // 如果当前记录数除以每页显示条数可以整除，则就是当前的页数
	// if (Recordnow % Pagesize == 0) {
	// Pagenow = Recordnow / Pagesize;
	// } else {
	// // 如果当前记录数除以每页显示条数不能整除，商加1才是当前页数
	// Pagenow = Recordnow / Pagesize + 1;
	// }
	// }

	public int getPagecount() {
		return Pagecount;
	}

	public void setPagecount(int Recordcount, int Pagesize) {
		// 如果总记录数除以每页显示条数可以整除，商就是总页数
		if (Recordcount % Pagesize == 0) {
			Pagecount = Recordcount / Pagesize;
		} else {
			// 如果总记录数除以每页显示条数不嫩整除，商加1才是总页数
			Pagecount = Recordcount / Pagesize + 1;
		}
	}

	public int getRecordnow() {
		return Recordnow;
	}

	public void setRecordnow(int recordnow) {
		Recordnow = recordnow;
	}

	public int getPagesize() {
		return Pagesize;
	}

	public void setPagesize(int pagesize) {
		Pagesize = pagesize;
	}

	public int getRecordcount() {
		return Recordcount;
	}

	public void setRecordcount(int recordcount) {
		Recordcount = recordcount;
	}

	public void setPagerRange(int pagerRange) {
		this.pagerRange = pagerRange;
	}

	public int getPagerRange() {
		return pagerRange;
	}
}
