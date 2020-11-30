package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dto.UserDTO;
public class BeforeUserDao  extends BaseDao{
	/**
	 * @discription 获得商品列表
	 */
	public List<Map<String, Object>>  getLastedGoods(String typeid){
		//首页
		if("0".equals(typeid)){
			String sql = "select * from goodstable gt,goodstype gy where gt.goodstype_id = gy.id  order by  gt.id desc";
			return select(sql, null);
		}else{
			String  sql = "select * from goodstable gt,goodstype gy where gt.goodstype_id = gy.id and gt.goodstype_id = ?  order by  gt.id desc";
			Object param[] = {typeid};
			return select(sql, param);
		}
	}
	/**
	 * @discription 获得销售排行商品
	 */
	public List<Map<String, Object>> getSaleOrder(){
		String sql = "select sum(od.shoppingnum) shopnumber," +
				" gd.id id, " + 
				" gd.gname gname, " + 
				" gd.gprice gprice, " + 
				" gd.gpicture  gpicture " + 
				" from goodstable gd   LEFT JOIN orderdetail  od  ON od.goodstable_id=gd.id" + 
				"  group by  " + 
				"  gd.id, " + 
				"  gd.gname, " + 
				"  gd.gprice, " + 
				"  gd.gpicture " + 
				" order by shopnumber desc limit 10 ";
		return select(sql, null);
	}
	/**
	 * @discription 注册
	 */
	public boolean register(UserDTO ud){
		String sql = "insert into busertable values(null,?,?) ";
		Object param[] = {ud.getBemail(), ud.getBpwd()};
		return upadateByParams(sql, param);
	}
	/**
	 * @discription 查询Email
	 */
	public List<Map<String, Object>> isExit(UserDTO ud){
		String sql = "select * from busertable where bemail = ? ";
		Object param[] = {ud.getBemail()};
		return select(sql, param);
	}
	/**
	 * @discription 登录判定
	 */
	public List<Map<String, Object>> isLogin(UserDTO ud){
		String sql = "select * from busertable where bemail = ? and bpwd = ? ";
		Object param[] = {ud.getBemail(), ud.getBpwd()};
		return select(sql, param);
	}
	/**
	 *  @discription 放入购物车
	 */
	public boolean putCart(String gno, int bid, String mknum){
		String sql1 = "select * from carttable where busertable_id=? and goodstable_id=? ";
		Object param1[] = {bid, gno};
		String sql2 = "update carttable set shoppingnum=shoppingnum+? where  busertable_id=? and goodstable_id=?";
		Object param2[] = {mknum, bid, gno};
		String sql3 = "insert into carttable values(null,?,?,?)";
		Object param3[] = {bid, gno, mknum};
		//购物车中已存在
		if(select(sql1, param1).size() > 0){
			return upadateByParams(sql2, param2);
		}else{//购物车中不存在
			return upadateByParams(sql3, param3);
		}
	}
	/**
	 * 修改购物车
	 */
	public boolean updateCart(String shoppingnum,String gno, int bid){
		String sql2 = "update carttable set shoppingnum=? where  busertable_id=? and goodstable_id=?";
		Object param2[] = {shoppingnum, bid, gno};
		return upadateByParams(sql2, param2);
	}
	/**
	 * @discription 查询购物车
	 */
	public List<Map<String, Object>> selectCart(int bid){
		String sql = " select gt.id, gt.gname, gt.gpicture, gt.gprice, ct.shoppingnum, ct.shoppingnum*gt.gprice smallsum " +
				" from goodstable gt, carttable ct where gt.id=ct.goodstable_id and ct.busertable_id=? ";
		Object param[] = {bid};
		return select(sql, param);
	}
	/**
	 * @discription 删除购物车
	 */
	public boolean deleteCart(int bid, String gno){
		String sql1 = "delete from carttable where busertable_id=?";
		Object param1[] = {bid};
		String sql2 = "delete from carttable where busertable_id=? and goodstable_id=?";
		Object param2[] = {bid, gno};
		if(gno == null){
			//清空购物车
			return upadateByParams(sql1, param1);
		}else{
			//删除一个商品
			return upadateByParams(sql2, param2);
		}
	}
	/**
	 * @discription 往订单表插入记录
	 */
	public int addOrder(int bid, String amount){
		String sql = "insert into orderbasetable values(null,?,?,?,now())";
		Object param[] = {bid, amount, "0"};//0代表没有支付
		String sql1 = " select LAST_INSERT_ID() from orderbasetable ";
		return getLastId(sql, sql1, param);
	}
	/**
	 * @discription 往订单表详情插入记录
	 */
	public boolean addOrderDetail(int ordersn,int bid){
		String sql = "insert into orderdetail (orderbasetable_id, goodstable_id, shoppingnum) select " + ordersn + ", goodstable_id, shoppingnum from carttable where busertable_id = ?  ";
		Object param[] = {bid};
		return upadateByParams(sql, param);
	}
	
	/**
	 * @discription 订单支付
	 */
	public boolean pay(String ordersn){
		String sql = "update orderbasetable set status=1 where id = ?";
		Object param[] = {ordersn};
		return upadateByParams(sql, param);
	}
	/**
	 * @discription 头部搜索框
	 */
	public List<Map<String, Object>> search(String keyword){
		String sql = "select * from goodstable where gname like ? ";
		Object param[] = {"%" + keyword + "%"};
		return select(sql, param);
	}
	/**
	 * @discription 我的订单
	 */
	public List<Map<String, Object>> myOrder(int bid){
		String sql = " select id, amount, busertable_id, status, orderdate  from orderbasetable where busertable_id = ? ";
		Object param[] = {bid};
		return select(sql, param);
	}
	/**
	 * @discription 我的订单详情
	 */
	public List<Map<String, Object>> myOrderDetail(String ordersn){
		String sql =" select gt.id, gt.gname, gt.gprice, gt.gpicture, odt.shoppingnum from  goodstable gt, orderdetail odt " +
				" where  odt.orderbasetable_id = ? and gt.id=odt.goodstable_id ";
		Object param[] = {ordersn};
		return select(sql, param);
	}
}
