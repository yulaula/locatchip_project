package board.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import board.model.vo.ShareReply;
import common.JDBCTemplate;
import board.model.vo.ShareBoard;

public class ShareBoardDAO {

	private Connection conn = null;
	private Properties prop = null;

	public ShareBoardDAO (Connection conn){
		this.conn = conn;
		prop = new Properties();
		FileReader fr;
		FileReader fr2;
		try {
			fr = new FileReader("./resources/data-source.properties");
			fr2 = new FileReader("./resources/query.properties");
			prop.load(fr);
			prop.load(fr2);
			fr.close();
			fr2.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	// 게시물의 갯수를 가져오는 쿼리문
	public int getBoardCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = prop.getProperty("SHAREBOARD_COUNT");
			//"SELECT COUNT(*) FROM BOARD WHERE STATUS='Y'"
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next() == true) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}


	// 게시물 정보를 가져오는 객체
	public List<ShareBoard> findAll() {
		List<ShareBoard> list = new ArrayList<ShareBoard>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = prop.getProperty("SHAREBOARD_FINDALL");
			/* 쿼리 확인 필요
			"SELECT SHARE_POST_NUM, SHARE_POST_TITLE, MEMBER_ID, POST_DATE, READCOUNT, STATUS, GOOD_ID, ENTP_ID "
					+ "FROM ("
					+ "    SELECT SHARE_POST_NUM, SHARE_POST_TITLE, MEMBER_ID, POST_DATE, READCOUNT, STATUS, GOOD_ID, ENTP_ID "
					+ "    FROM ("
					+ "        SELECT  B.SHARE_POST_NUM, B.SHARE_POST_TITLE, M.MEMBER_ID, B.POST_DATE, B.READCOUNT, B.STATUS, B.GOOD_ID "
					+ "        FROM SHARE_BBS B "
					+ "				JOIN MEMBER M ON(B.MEMBER_ID = M.MEMBER_ID) "
					+ " 			JOIN STORE_INFO S ON(B.ENTP_ID = S.ENTP_ID) "
					+ "        WHERE B.STATUS = 'Y' ORDER BY B.SHARE_POST_NUM DESC"
					+ "    )"
					+ ")";
					*/
			
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while(rs.next()) {	
				ShareBoard sBoard = new ShareBoard();
				sBoard.setPostNo(rs.getString("SHARE_POST_NUM"));
				sBoard.setTitle(rs.getString("SHARE_POST_TITLE"));
				sBoard.setWriterId(rs.getString("MEMBER_ID"));
				sBoard.setPostDate(rs.getDate("POST_DATE"));
				sBoard.setReadCount(rs.getInt("READCOUNT"));
				sBoard.setStatus(rs.getString("STATUS"));
				sBoard.setShopId(rs.getString("GOOD_ID"));
				sBoard.setShopId(rs.getString("ENTP_ID"));
				
				list.add(sBoard);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}


	// 글쓰기 기능
	public int insertBoard(ShareBoard sBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = prop.getProperty("SHAREBOARD_WRITE");
			//INSERT INTO SHARE_BBS VALUES(?,?,?,DEFAULT,DEFAULT,?,?,DEFAULT,?,?,?)
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, sBoard.getPostNo());
			pstmt.setString(2, sBoard.getPostPassword());
			pstmt.setString(3, sBoard.getTitle());
			pstmt.setString(4, sBoard.getContent());
			pstmt.setString(5, sBoard.getLocation());
			pstmt.setString(6, sBoard.getWriterId());
			pstmt.setString(7, sBoard.getShopId());
			pstmt.setString(8, sBoard.getProductId());			
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return result;
	}

	// 게시글을 가져오는 객체
	public ShareBoard findBoardByNo(int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ShareBoard sBoard = null;
		try {
			String sql = prop.getProperty("SHAREBOARD_FIND_BOARD_BY_NO");
			/*"SELECT  B.SHARE_POST_NUM, B.SHARE_POST_TITLE, M.MEMBER_ID, "
					+ "B.READCOUNT, B.POST, B.LOCATION, B.POST_DATE "
					+ "FROM BOARD B "
					+ "JOIN MEMBER M ON(B.MEMBER_ID = M.MEMBER_ID) "
					+ "WHERE B.STATUS = 'Y' AND B.NO=? ";
					*/
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();

			if(rs.next() == true) {
				sBoard = new ShareBoard();
				sBoard.setPostNo(rs.getString("SHARE_POST_NUM"));
				sBoard.setPostPassword(rs.getString("SHARE_POST_PW"));
				sBoard.setTitle(rs.getString("SHARE_POST_TITLE"));
				sBoard.setReadCount(rs.getInt("READCOUNT"));
				sBoard.setContent(rs.getString("POST"));
				sBoard.setLocation(rs.getString("LOCATION"));
				sBoard.setPostDate(rs.getDate("POST_DATE"));
				sBoard.setWriterId(rs.getString("MEMBER_ID"));
				sBoard.setReplies(getRepliesByNo(boardNo));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sBoard;
	}

	// 게시글 조회수 올려주는 쿼리
	public int updateReadCount(ShareBoard board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			sql = prop.getProperty("SHAREBOARD_READCOUNT");
			//"UPDATE SHARE_BBS SET READCOUNT=? WHERE NO=?"
			pstmt = conn.prepareStatement(sql);

			board.setReadCount(board.getReadCount() + 1);

			pstmt.setInt(1, board.getReadCount());
			pstmt.setString(2, board.getPostNo());

			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 게시글 삭제(실제로는 안보여주기 기능) 를 위한 쿼리
	public int updateStatus(int boardNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			sql = prop.getProperty("SHAREBOARD_DELETE");
			//UPDATE BOARD SET STATUS=? WHERE NO=?
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, status);
			pstmt.setInt(2, boardNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int updateBoard(ShareBoard sBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			sql = prop.getProperty("SHAREBOARD_UPDATE");
			// UPDATE SHARE_BBS SET SHARE_POST_TITLE=?,POST=?,LOCATION=?, ENTP_ID=?, GOOD_ID=? WHERE NO=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sBoard.getTitle());
			pstmt.setString(2, sBoard.getContent());
			pstmt.setString(3, sBoard.getLocation());
			pstmt.setString(4, sBoard.getShopId());
			pstmt.setString(5, sBoard.getProductId());
			pstmt.setString(6, sBoard.getPostNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	/*리플 부터 수정 필요!!! */

	// 리플을 가져오는 메소드
	public List<ShareReply> getRepliesByNo(int boardNo) {
		List<ShareReply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT R.NO, R.BOARD_NO, R.CONTENT, M.ID, R.CREATE_DATE, R.MODIFY_DATE "
				+ "FROM REPLY R "
				+ "JOIN MEMBER M ON(R.WRITER_NO = M.NO) "
				+ "WHERE R.STATUS='Y' AND BOARD_NO= ? "
				+ "ORDER BY R.NO DESC";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ShareReply reply = new ShareReply();
				reply.setNo(rs.getInt("NO"));
				reply.setBoardNo(rs.getInt("BOARD_NO"));
				reply.setContent(rs.getString("CONTENT"));
				reply.setWriterId(rs.getString("ID"));
				reply.setCreateDate(rs.getDate("CREATE_DATE"));
				reply.setModifyDate(rs.getDate("MODIFY_DATE"));
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 리플 쓰기 기능
	public int insertReply(ShareReply reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			sql = prop.getProperty("SHAREREPLY_DELETE");
			// INSERT INTO SHAREREPLY VALUES(SEQ_REPLY_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, reply.getBoardNo());
			pstmt.setInt(2, reply.getWriterNo());
			pstmt.setString(3, reply.getContent());

			result = pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		return result;
	}

	public int deleteReply(int replyNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			sql = prop.getProperty("SHAREBOARD_DELETE_REPLY");
			// DELETE SHAREREPLY WHERE NO=?
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static void main(String[] args) {
		
		
	}
}
