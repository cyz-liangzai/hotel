package com.example.hotel.entity;

import lombok.Data;

import java.util.Date;

//房间预订订单类
@Data
public class User_Room {
    int id;
    String rno;
    String user_name;
    String phone;
    Date time_start;
    Date time_end;
}
