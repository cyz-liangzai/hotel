package com.example.hotel.mapper;

import com.example.hotel.entity.Room;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

//房间-数据库接口
@Mapper
public interface RoomMapper {
    List<Room> selectAll();
    //查看所有房间

    List<Room> selectEmpty();
    //查看所有空房间

    int setBook(String rno);
    //预订房间，返回值为是否成功

    int Unsubscribe(String rno);
    //退订房间，返回值为是否成功

    int SmallRoom();
//    查寻房型为small的房间数同时状态是空的

    int BigRoom();

    int Middle();

    Room addRoom(Room room);
//    增加房间

    int DeleteRoom(int Id);
//    根据id删除房间

    int re_Price(int rno);
//    更改房间价格

    int re_Status(int rno);
//    更改房间状态

}
