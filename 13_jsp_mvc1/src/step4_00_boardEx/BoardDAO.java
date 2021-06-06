package step4_00_boardEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.util.Vector;



public class BoardDAO {
	
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}


	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public Connection getConnection() {
		
		String dbURL 	  = "jdbc:mysql://localhost:3306/STEP4_BOARD_EX?serverTimezone=UTC";
		String dbID 	  = "root";
		String dbPassword = "1234";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	// [페이징 테스트용] 데이터 생성 DAO
	public void setDummy() {
		
		Random ran = new Random();
		
		try {
			
			
			String[] word = {"가","나","다","라","마","바","사","아","자","차","카","타","파","하"};
			
			
			for (int i = 1; i < 201; i++) {
				
				String writer  = "";
				String passwd  = "1111";
				String subject = "";
				String email   = "";
				String content = "";
				for (int j = 0; j < 7; j++) {
					writer  += word[ran.nextInt(word.length)];
					subject += word[ran.nextInt(word.length)];
					content += word[ran.nextInt(word.length)];
					if (j < 4) {
						email += word[ran.nextInt(word.length)];
					}
				}
				email += "@gmail.com";
				
				String sql = "INSERT INTO BOARD(WRITER,EMAIL,SUBJECT,PASSWORD,REG_DATE,REF,RE_STEP,RE_LEVEL,READ_COUNT,CONTENT)";
					   sql += "VALUES(?, ?, ?, ?, now(), ?, 1, 1, 0, ?)";
				
			    conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, writer);
				pstmt.setString(2, email);
				pstmt.setString(3, subject);
				pstmt.setString(4, passwd);
				pstmt.setInt(5, i);
				pstmt.setString(6, content);
				pstmt.executeUpdate();
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) 	{try {rs.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null) {try {conn.close();}   catch (SQLException e) {}}
		}
		
	}
	
	
	// 게시글 생성 DAO
	public void insertBoard(BoardDTO boardDTO) {

		int ref = 0;
		int num = 0;
		
		try {
			
			conn = getConnection();

			pstmt = conn.prepareStatement("SELECT MAX(REF) FROM BOARD");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ref = rs.getInt(1) + 1;
			}

			pstmt = conn.prepareStatement("SELECT MAX(NUM) FROM BOARD");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			pstmt = conn.prepareStatement("INSERT INTO BOARD VALUES(?, ?, ?, ?, ?, now()," + " ?, 1, 1, 0, ?)");
			pstmt.setInt(1, num);
			pstmt.setString(2, boardDTO.getWriter());
			pstmt.setString(3, boardDTO.getEmail());
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getPassword());
			pstmt.setInt(6, ref);
			pstmt.setString(7, boardDTO.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null) {try {conn.close();}   catch (SQLException e) {}}
		}
		
	}

	
	// 게시글을 수정하는 DAO
	public boolean updateBoard(BoardDTO boardDTO) {

		boolean isUpdate = false;
		
		try {
			
			if (validMemberCheck(boardDTO)) {
				conn = getConnection();
				pstmt = conn.prepareStatement("UPDATE BOARD SET SUBJECT=?, CONTENT=? WHERE NUM=?");
				pstmt.setString(1, boardDTO.getSubject());
				pstmt.setString(2, boardDTO.getContent());
				pstmt.setInt(3, boardDTO.getNum());
				pstmt.executeUpdate();
				System.out.println("board테이블이 업데이트 되었습니다.");
				System.out.println(boardDTO.getNum() + "/" + boardDTO.getWriter() + "/" + boardDTO.getSubject());
				isUpdate = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}
		
		return isUpdate;
		
	}

	
	// 게시글을 삭제하는 DAO
	public boolean deleteBoard(BoardDTO boardDTO) {

		boolean isDelete = false;
		
		try {
			
			if (validMemberCheck(boardDTO)) {
				conn = getConnection();
				pstmt = conn.prepareStatement("DELETE FROM BOARD WHERE NUM=?");
				pstmt.setInt(1, boardDTO.getNum());
				pstmt.executeUpdate();
				System.out.println("board테이블이의 멤버가 삭제되었습니다.");
				System.out.println(boardDTO.getNum() + "/" + boardDTO.getWriter() + "/" + boardDTO.getSubject());
				isDelete = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}
		
		return isDelete;
		
	}
	
	
	// 전체 게시글 갯수를 조회하는 DAO
	public int getAllCount(String searchKeyword , String searchWord) {
		
		int totalBoardCount = 0;
		
		try {
			
			conn = getConnection();
			
			String sql = "";
			if (searchKeyword.equals("total")) { // searchKeyword가 전체검색일 경우
				if (searchWord.equals("")) { // 특정 키워드가 없을경우 (보통의 경우) 
					sql = "SELECT COUNT(*) FROM BOARD";
				}
				else {	// 특정 키워드가 있을 경우
					sql = "SELECT COUNT(*) FROM BOARD ";
					sql += "WHERE SUBJECT LIKE '%" + searchWord +"%' OR ";
					sql += "WRITER LIKE '%" + searchWord +"%' "; 
				}
				
			}
			else { // searchKeyword가 전체검색이 아닐 경우
				sql = "SELECT COUNT(*) FROM BOARD WHERE " + searchKeyword + " LIKE '%" + searchWord +"%'"; 
			}
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				totalBoardCount = rs.getInt(1);
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null) {try {conn.close();}   catch (SQLException e) {}}
		}
		
		return totalBoardCount;
		
	}


	// 한개의 게시글 정보를 조회하는 DAO
	public BoardDTO getOneBoard(int num) {

		BoardDTO bean = new BoardDTO();

		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE BOARD SET READ_COUNT=READ_COUNT+1 WHERE NUM=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NUM=?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setRegDate(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setReStep(rs.getInt(8));
				bean.setReLevel(rs.getInt(9));
				bean.setReadCount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null) {try {conn.close();}   catch (SQLException e) {}}
		}
		return bean;
	}

	
	// 전체(검색) 게시글을 조회하는 DAO
	public ArrayList<BoardDTO> getSearchBoard(String searchKeyword, String searchWord,  int startBoardIdx, int searchCount) {

		ArrayList<BoardDTO> vec = new ArrayList<BoardDTO>();
		BoardDTO bdto = null;
		
		try {
			
			conn = getConnection();
			String sql = "";
			
			if (searchKeyword.equals("total")) { // searchKeyword가 전체검색일 경우
				if (searchWord.equals("")) { // 특정 키워드가 없을경우 (보통의 경우) 
					sql = "SELECT * FROM BOARD ORDER BY REF DESC , RE_STEP LIMIT ?,?";
				}
				else {	// 특정 키워드가 있을 경우
					sql = "SELECT * FROM BOARD ";
					sql += "WHERE SUBJECT LIKE '%" + searchWord +"%' OR ";
					sql += "WRITER LIKE '%" + searchWord +"%' "; 
					sql += "ORDER BY REF DESC , RE_STEP LIMIT  ?,?";
				}
				
			}
			else { // searchKeyword가 전체검색이 아닐 경우
				sql = "SELECT * FROM BOARD  WHERE " + searchKeyword + " LIKE '%" + searchWord +"%' ORDER BY REF DESC , RE_STEP LIMIT ?,?"; 
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startBoardIdx);
			pstmt.setInt(2, searchCount);


			rs = pstmt.executeQuery();

			while (rs.next()) {
				bdto = new BoardDTO();
				bdto.setNum(rs.getInt(1));
				bdto.setWriter(rs.getString(2));
				bdto.setEmail(rs.getString(3));
				bdto.setSubject(rs.getString(4));
				bdto.setPassword(rs.getString(5));
				bdto.setRegDate(rs.getDate(6).toString());
				bdto.setRef(rs.getInt(7));
				bdto.setReStep(rs.getInt(8));
				bdto.setReLevel(rs.getInt(9));
				bdto.setReadCount(rs.getInt(10));
				bdto.setContent(rs.getString(11));
				vec.add(bdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null) {try {conn.close();}   catch (SQLException e) {}}
		}
		
		return vec;
		
	}
	
	
	// 업데이트하기 위한 게시글을 불러오는 DAO
	public BoardDTO getOneUpdateBoard(int num) {

		BoardDTO bdto = new BoardDTO();

		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NUM=?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bdto.setNum(rs.getInt(1));
				bdto.setWriter(rs.getString(2));
				bdto.setEmail(rs.getString(3));
				bdto.setSubject(rs.getString(4));
				bdto.setPassword(rs.getString(5));
				bdto.setRegDate(rs.getDate(6).toString());
				bdto.setRef(rs.getInt(7));
				bdto.setReStep(rs.getInt(8));
				bdto.setReLevel(rs.getInt(9));
				bdto.setReadCount(rs.getInt(10));
				bdto.setContent(rs.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null) {try {conn.close();}   catch (SQLException e) {}}
		}
		
		return bdto;
		
	}


	// 인증된 유저인지 검증하는 DAO
	public boolean validMemberCheck(BoardDTO boardDTO) {

		boolean isValidMember = false;
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NUM=? AND PASSWORD=?");
			pstmt.setInt(1, boardDTO.getNum());
			pstmt.setString(2, boardDTO.getPassword());
			rs = pstmt.executeQuery();

			if (rs.next()) 	isValidMember = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}

		return isValidMember;
		
	}

	
	// 댓글 등록 DAO
	public void reWriteBoard(BoardDTO boardDTO) {
		 
		int ref      = boardDTO.getRef();
		int reStep   = boardDTO.getReStep();
		int reLevel  = boardDTO.getReLevel();
		int boardNum = 0;

		try {

			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT MAX(NUM) FROM BOARD");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardNum = rs.getInt(1) + 1;
			}

			pstmt = conn.prepareStatement("UPDATE BOARD SET RE_STEP=RE_STEP+1 WHERE REF=? and RE_STEP > ?");
			pstmt.setInt(1, ref);
			pstmt.setInt(2, reStep);
			pstmt.executeUpdate();

			String sql = "INSERT INTO BOARD (NUM , WRITER, EMAIL, SUBJECT, PASSWORD, ";
				   sql+= "REG_DATE, REF, RE_STEP, RE_LEVEL, READ_COUNT, CONTENT) " + "VALUES (?,?,?,?,?,NOW(),?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNum);
			pstmt.setString(2, boardDTO.getWriter());
			pstmt.setString(3, boardDTO.getEmail());
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getPassword());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, reStep + 1);
			pstmt.setInt(8, reLevel + 1);
			pstmt.setString(9, boardDTO.getContent());
			pstmt.executeUpdate();
			System.out.println("댓글이 등록되었습니다.");
			System.out.println(boardDTO.getNum() + "/" + boardDTO.getWriter() + "/" + boardDTO.getSubject());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}

	}
	
}
