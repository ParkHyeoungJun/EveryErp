package kr.erp.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardAdminVO {
      public Long code;
      public boolean reply;
      public boolean answer;
      public boolean editor;
      public boolean attach;
      public boolean declar;
      public boolean auth;
      public String title;
      public String writer;
      public Date day;
      public String updater;
      public Date updatedate;
      public String ip;
}