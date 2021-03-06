package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {
   @Select("select * from board where boardtype = 1")
   List<Board> noboardlist(Object object);
   
   @Select("select * from board where boardtype = 2 limit #{startrow}, #{limit}")
   List<Board> suboardlist(Map<String, Object> param);

   @Insert("insert into board (id,boardsubject, boardcontent,boarduptime, boardtype) values('admin',#{boardsubject},#{boardcontent},now(),1)")
   void noticewrite(Map<String, Object> param);

   @Select("select count(*) from board where boardtype = 2")
   int suboardcount();

   @Select("select * from board where boardnum=#{boardnum}")
   Board boarddetail(Map<String, Object> param);
   
   @Select("select count(*) from board where boardtype = #{boardtype}")
   int reboardcount(Map<String, Object> param);

   @Select("select * from board where boardtype = 3 limit #{startrow}, #{limit}")
   List<Board> reboardlist(Map<String, Object> param);

   @Select("select * from board where boardtype = #{boardtype} limit #{startrow}, #{limit}")
   List<Board> ajaxreboardlist(Map<String, Object> param);
   
   @Insert("insert into board (id,boardsubject,boardcontent,boarduptime,boardtype) values(#{id},#{boardsubject},#{boardcontent},now(),2)")
   void suboardinsert(Map<String, Object> param);

   @Select("select * from board where boardtype = 2 and id=#{id}")
   List<Board> mysuboardlist(Map<String, Object> param);

   @Update("update board set accept=1 where boardnum=#{boardnum}")
   void acceptup(Map<String, Object> param);

   @Insert("insert into board (id,boardsubject,boardcontent,boarduptime,boardtype) values(#{id},#{boardsubject},#{boardcontent},now(),#{boardtype})")
   void reboardwrite(Board board);

   @Select("SELECT * FROM board WHERE boardtype IN (3,4,5) ORDER BY boardnum DESC LIMIT 5")
   List<Board> review5();

   
   
}