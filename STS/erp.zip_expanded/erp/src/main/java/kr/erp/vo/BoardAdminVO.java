package kr.erp.vo;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class BoardAdminVO {
		public Long code;
		public String reply;
		public String answer;
		public String editor;
		public String attach;
		public String declar;
		public String notice;
		public String auth;
		public String title;
		public String writer;
		public Date day;
		public String updater;
		public Date updatedate;
		public String ip;
}
