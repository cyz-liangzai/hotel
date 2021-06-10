package com.example.hotel.entity;

import lombok.Data;

//房间类
@Data
public class Room {
    String rno;
    String size;
    String status;
    double price;
    int repair_status;
}
