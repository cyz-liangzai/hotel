package com.example.hotel.entity;

import lombok.Data;

//房间状态类,房间维护
@Data
public class Room_Status {
    int id;
    String rno;
    String repair_name;
    String body;
    int repair_status;
}
