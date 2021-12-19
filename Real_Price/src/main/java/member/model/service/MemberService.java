package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import member.model.dao.MemberDao;
import member.model.vo.Member;


public class MemberService {
	private MemberDao memberDao = null;
	private Connection conn = null;

	public MemberService() {
		init();
	}

	public void init() {
		if (conn != null) {
			close(conn);
		}
		conn = getConnection();
		memberDao = new MemberDao(conn);
	}

	@Override
	protected void finalize() throws Throwable {
		close(conn);
	}

	public List<Member> selectAll() throws SQLException {
		memberDao.setConn(conn);
		return memberDao.selectAll();
	}

	public Member selectOne(String memberId) {

		if (memberId == null) {
			return null;
		}
		memberDao.setConn(conn);
		return memberDao.selectOne(memberId);
	}

	public int insertUser(Member member) {
		int result = memberDao.insertMember(member);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int updateUser(Member member) {
		Member tempMember = selectOne(member.getMemberId());
		if (tempMember != null) {
			return ERROR_CODE_USER_DUPLE;
		}

		int result = memberDao.updateMember(member);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int deleteUser(String memberId) {
		Member tempUser = selectOne(memberId);
		if (tempUser != null) {
			return ERROR_CODE_USER_DUPLE;
		}

		int result = memberDao.deleteUser(memberId);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public Member login(String uSERID, String pASSWORD) {
		if (uSERID == null) {
			return null;
		}
		
		Member member = memberDao.selectOne(uSERID);
		
		
		if(member.getMemberId().equals(uSERID) && member.getPassword().equals(pASSWORD)) {
			return member;
		}else {
			return null;
		}
	}

	/*
	public List<User> selectByName(String userName) {
		return userDao.selectByName(userName);
	}
	*/

}
