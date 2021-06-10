package com.example.hotel.mapper;

import com.example.hotel.entity.User_Room;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;

//房间预订-数据库接口
@Mapper
public interface User_RoomMapper {
    List<User_Room> selectAll();
    //返回预订的用户

    int setUser(String rno, String user_name, String phone, Date time_start,Date time_end);
    //用户预订房间

    int unBook(String rno);
    //退订房间

    User_Room findByName(String user_name);
//    根据名字查询订单

    User_Room findByPhone(String phone);
//    根据电话查询订单
}
