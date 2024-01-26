package com.multi.semipjt.pharmacy.model.vo;

public class PharmacyParam {
	// html - form의 name과 일치하는 파라메터
		private String holidayck;
		private String nightck;
		private String name;
		private String sido1;
		private String gugun1;
		

		// 페이징 인자
		private int page;
		private int limit;
		private int offset;

		public PharmacyParam() {
			super();
			page = 1;
		}

		
		public PharmacyParam(String holidayck, String nightck, String name, String sido1, String gugun1, int page,
				int limit, int offset) {
			super();
			this.holidayck = holidayck;
			this.nightck = nightck;
			this.name = name;
			this.sido1 = sido1;
			this.gugun1 = gugun1;
			this.page = page;
			this.limit = limit;
			this.offset = offset;
		}


		@Override
		public String toString() {
			return "PharmacyParam [holidayck=" + holidayck + ", nightck=" + nightck + ", name=" + name + ", sido1="
					+ sido1 + ", gugun1=" + gugun1 + ", page=" + page + ", limit=" + limit + ", offset=" + offset + "]";
		}


		public String getholidayck() {
			return holidayck;
		}

		public void setHolidayck(String holidayck) {
			this.holidayck = holidayck;
		}

		public String getnightck() {
			return nightck;
		}

		public void setnightck(String nightck) {
			this.nightck = nightck;
		}
		
		public String getname() {
			return name;
		}

		public void setname(String name) {
			this.name = name;
		}
		
		
		public String getSido1() {
			return sido1;
		}


		public void setSido1(String sido1) {
			this.sido1 = sido1;
		}


		public String getGugun1() {
			return gugun1;
		}


		public void setGugun1(String gugun1) {
			this.gugun1 = gugun1;
		}


		public int getPage() {
			return page;
		}

		public void setPage(int page) {
			this.page = page;
		}

		public int getLimit() {
			return limit;
		}

		public void setLimit(int limit) {
			this.limit = limit;
		}

		public int getOffset() {
			return offset;
		}

		public void setOffset(int offset) {
			this.offset = offset;
		}

}
