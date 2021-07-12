package com.web.shop.orderlist.dto;

import java.sql.Date;

public class PaymentDetailDTO {
	// 결제정보 (총합계, 배송비, 상품할인금액, 쿠폰할인, 적립금사용, 결제금액, 적립예정금액, 결제방법)
	// -> 총합계, 카카오페이 포인트 사용, 결제금액(총합 - 포인트), 결제방법  -> kakaopay 주문조회 api 사용
	
	private int total;
	private int point;
	private String payment_method_type;
	private String approved_at;
	
	public String getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(String approved_at) {
		this.approved_at = approved_at;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getPayment_method_type() {
		String type = "";
		if(payment_method_type.equals("MONEY")) {
			type = "카카오페이 머니";
		} else if(payment_method_type.equals("CARD")) {
			type = "카드";
		}
		return type;
	}
	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	
}
