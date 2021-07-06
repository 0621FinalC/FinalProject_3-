package com.web.shop.orderlist.dto;

import java.sql.Date;

public class PaymentDetailDTO {
	// 결제정보 (총합계, 배송비, 상품할인금액, 쿠폰할인, 적립금사용, 결제금액, 적립예정금액, 결제방법)
	// -> 총합계, 카카오페이 포인트 사용, 결제금액(총합 - 포인트), 결제방법  -> kakaopay 주문조회 api 사용
	
	private int total;
	private int point;
	private int total_pay = total - point;
	private String payment_method_type;
	private Date approved_at;
	
	public Date getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}
	public void setApproved_at(String approved_at) {
		this.approved_at = Date.valueOf(approved_at);
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
	public int getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(int total_pay) {
		this.total_pay = total_pay;
	}
	public String getPayment_method_type() {
		return payment_method_type;
	}
	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	
}
