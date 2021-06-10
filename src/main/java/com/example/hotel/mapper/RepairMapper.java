package com.example.hotel.mapper;

import com.example.hotel.entity.Room_Status;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

//房间维护-数据库接口
@Mapper
public interface RepairMapper {
    List<Room_Status> selectAll();
    //查找所有repair_status为1的房间

    int setRepair(String user_name);
    //维修人员确认需要维护的房间,返回0表示设置成功，1为失败

    int setrepair(String rno,String body);
    //客户反映房间问题,repair_status设为0,返回值为是否插入成功


}
