package com.thien.cineman827.dao;

import com.thien.cineman827.model.Bill;
import com.thien.cineman827.model.Showtime;

import java.util.ArrayList;
import java.util.List;

public class BillDAO extends DAO{

    public BillDAO(){
        super();
    }

    public List<Bill> getBillByShowtime(Showtime showtime){
        return new ArrayList<Bill>();
    }
}
