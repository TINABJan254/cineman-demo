package com.thien.cineman827.dao;

import com.thien.cineman827.model.Member;

public class MemberDAO extends DAO{

    public MemberDAO() {
        super();
    }

    public Member checkLogin(Member member) {
        String sql = "SELECT * FROM tblMember";
        return new Member();
    }
}
