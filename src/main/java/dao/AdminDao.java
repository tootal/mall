package dao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import dto.AdminDTO;
import dto.GoodsDTO;

public class AdminDao extends BaseDao{
	public boolean adminLogin(AdminDTO adt){
		String sql = "select * from ausertable where aname = ? and apwd = ?";
		Object param[] = {adt.getAname(), adt.getApwd()};
		List<Map<String, Object>> list = select(sql, param);
		if (list.size() > 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean addType(String typename){
		String sql = "insert into goodstype values(null,?)";
		Object param[] = {typename};
		return upadateByParams(sql, param);
	}
	public List<Map<String, Object>> getReType(String id){
		String sql = "select * from goodstable where goodstype_id = ?";
		Object param[] = {id};
		return select(sql, param);
	}
	public List<Map<String, Object>> selectGoods(){
		String sql = "select * from goodstable gt,goodstype gy where gt.goodstype_id = gy.id ";
		Object param[] = null;
		return select(sql, param);
	}
	/**
	 * @discription 分页查询商品
	 */
	public List<Map<String, Object>> selectAllGoodsByPage(int startIndex, int perPageSize){
		String sql = "select * from goodstable gt,goodstype gy where gt.goodstype_id = gy.id order by gt.id limit ?, ?";
		Object param[] = {startIndex, perPageSize};
		return select(sql, param);
	}
	/**
	 * @discription 获得商品类型列表
	 */
	public  List<Map<String, Object>> getGoodsType(){
		String sql = "select * from goodstype";
		Object param[] = null;
		return select(sql, param);
	}
	/**
	 * 删除类型
	 */
	public boolean deleteType(String id) {
		String sql = "delete  from goodstype where id = ? ";
		Object param[] = {id};
		return upadateByParams(sql, param);
	}
	/**
	 * @discription 添加商品
	 */
	public boolean addGoods(GoodsDTO gd){
		String sql = "insert into goodstable values(null,?,?,?,?)";
		Object param[] = {
				gd.getGname(),
				gd.getGprice(),
				gd.getGpicture(),
				gd.getGoodstype_id()
			};
		return upadateByParams(sql, param);
	}
	/**
	 *  @discription 查询一个商品
	 */
	public List<Map<String, Object>> selectAGoods(String gno){
		String sql = "select * from goodstable gt,goodstype gy where gt.goodstype_id = gy.id and gt.id = ?";
		Object param[] = {gno};
		return select(sql, param);
	}
	/**
	 * @discription 修改商品
	 */
	public boolean updateGoods(GoodsDTO gd){
		String sql = "update goodstable set gname = ?, gprice = ?, gpicture = ?, goodstype_id = ? where id = ?";
		Object param[] = {
				gd.getGname(),
				gd.getGprice(),
				gd.getGpicture(),
				gd.getGoodstype_id(),
				gd.getId()
				};
		return upadateByParams(sql, param);
	}
	/**
	 * @discription 删除商品
	 */
	public boolean deleteAgoods(String gno){
		String sql = "delete from goodstable where id = ? ";
		Object param[] = {gno};
		return upadateByParams(sql, param);
	}
	/**
	 * @discription 条件查询
	 */
	public List<Map<String, Object>> conditionSelectGoods(String gname, String typeid){
		StringBuffer sql = new StringBuffer("select * from goodstable gt,goodstype gy where gt.goodstype_id = gy.id and 1 = 1 ");
		ArrayList<String> param = new ArrayList<String>();
		//输入商品名的情况
		if(null != gname && gname.trim().length() > 0){
			sql.append(" and gname like ? ");
			param.add("%" + gname + "%");
		}
		//选中商品类型的情况
		if(!"all".equals(typeid)){
			sql.append(" and gt.goodstype_id = ? ");
			param.add(typeid);
		}
		return select(sql.toString(), param.toArray());
	}
	/**
	 * @discription 分页条件查询
	 */
	public List<Map<String, Object>> conditionSelectGoodsByPage(String gname, String typeid, int startIndex, int perPageSize){
		StringBuffer sql = new StringBuffer("select * from goodstable gt,goodstype gy where gt.goodstype_id = gy.id and 1 = 1 ");
		ArrayList<Object> param = new ArrayList<Object>();
		//输入商品名的情况
		if(null != gname && gname.trim().length() > 0){
			sql.append(" and gname like ? ");
			param.add("%" + gname + "%");
		}
		//选中商品类型的情况
		if(!"all".equals(typeid)){
			sql.append(" and gt.goodstype_id = ? ");
			param.add(typeid);
		}
		param.add(startIndex);
		param.add(perPageSize);
		sql.append(" limit ?, ? "); 
		return select(sql.toString(), param.toArray());
	}
	/**
	 * @discription 删除商品时，判断有无关联
	 */
	public  boolean isDelete(String gno){
		String sql1 = "select * from carttable where goodstable_id=?";
		String sql3 = "select * from orderdetail where goodstable_id=?";
		Object param[] = {gno};
		//有子记录
		if(select(sql1, param).size() > 0 ||
				select(sql3, param).size() > 0){
			return false;
		}else{
			return true;
		}
	}
	/**
	 *  @discription 查询用户
	 */
	public List<Map<String, Object>> selectUsers(){
		String sql = "select * from busertable ";
		return select(sql, null);
	}
	/**
	 * @discription 删除用户时，判断有无关联
	 */
	public  boolean isDeleteUser(String bid){
		String sql1 = "select * from carttable where busertable_id=?";
		String sql3 = "select * from orderbasetable where busertable_id=?";
		Object param[] = {bid};
		//有子记录
		if(select(sql1, param).size() > 0 ||
				select(sql3, param).size() > 0){
			return false;
		}else{
			return true;
		}
	}
	/**
	 * @discription 删除用户
	 */
	public boolean deleteUser(String bid){
		String sql = "delete from busertable where id=?";
		Object param[] = {bid};
		return upadateByParams(sql, param);
	}
	/**
	 *  @discription 查询订单
	 */
	public List<Map<String, Object>> selectOrders(){
		String sql = "select ot.id, ot.amount, ot.status, "
				+ "  orderdate, bt.bemail, ot.busertable_id "
				+ " from orderbasetable ot, busertable bt where ot.busertable_id=bt.id ";
		return select(sql, null);
	}

	/**
	 *  @discription 查询销售报表
	 */
	public List<Map<String, Object>> selectReport() {
		String sql = "select gt.id, gname, gprice, sum(shoppingnum) num"
				+ " from goodstable gt, orderdetail ot"
				+ " where gt.id=ot.goodstable_id"
				+ " group by gt.id";
		return select(sql, null);
	}

	/**
	 *  @discription 删除订单明细
	 */
	public boolean deleteOrderdetail(String ordersn){
		String sql = "delete from orderdetail where orderbasetable_id=?";
		Object param[] = {ordersn};
		return upadateByParams(sql, param);
	}
	/**
	 *  @discription 删除订单
	 */
	public boolean deleteOrderbasetable(String ordersn){
		String sql = "delete from orderbasetable where id=?";
		Object param[] = {ordersn};
		return upadateByParams(sql, param);
	}
}
