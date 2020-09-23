package zhihu.dao;

public class ApproveNumDao extends BaseDao{

    /**
     * 修改赞同数
     * @param a
     * @param tableName
     * @return
     */
    public int setApproveNum(String a,String tableName,String id){
        return execUpdate(ifTable(a, tableName, id));
    }

    /**
     * 判断表名返回 sql
     * @param tableName
     * @return
     */
    public String ifTable(String a,String tableName,String id){
        var sql = "";
        if ("commentreply".equals(tableName)){
            sql = "UPDATE "+ tableName +" SET approveNum = approveNum"+ a +"1 WHERE commentReplyId = '"+ id +"'";
        }else if ("comment".equals(tableName)){
            sql = "UPDATE "+ tableName +" SET approveNum = approveNum"+ a +"1 WHERE commentId = '"+ id +"'";
        }else if("answer".equals(tableName)){
            sql = "UPDATE "+ tableName +" SET approveNum = approveNum"+ a +"1 WHERE answerId = '"+ id +"'";
        }else if ("question".equals(tableName)){
            sql = "UPDATE "+ tableName +" SET approveNum = approveNum"+ a +"1 WHERE questionID = '"+ id +"'";
        }
        System.out.println(sql);
        return sql;
    }
}
