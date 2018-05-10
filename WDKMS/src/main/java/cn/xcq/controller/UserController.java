package cn.xcq.controller;

import cn.xcq.annotation.BusinessAnnotation;
import cn.xcq.entity.*;
import cn.xcq.entity.Dictionary;
import cn.xcq.service.*;
import cn.xcq.util.ExcelUtilTool;
import cn.xcq.util.MD5;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2018/4/6.
 */
@Controller
public class UserController {
    //注入IUserInfoService接口对象
    @Resource(name = "userInfoService")
    private IUserInfoService userInfoService;

    //注入IPrivilegeService对象
    @Resource(name = "privilegeService")
    private IPrivilegeService iPrivilegeService;

    //注入Service层对象
    @Resource(name = "roleService")
    private IRoleService iRoleService;

    @Resource(name = "dicService")
    private IDictionaryService iDictionaryService;


    public IRoleService getiRoleService() {
        return iRoleService;
    }

    public void setiRoleService(IRoleService iRoleService) {
        this.iRoleService = iRoleService;
    }

    @InitBinder
    public void resolveException(WebDataBinder webDataBinder) {
        //设置转换格式
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        //参数一:转换格式      参数二:是否允许为空字符串
        webDataBinder.registerCustomEditor(Date.class,new CustomDateEditor(sdf,true));
    }


    //登录
    @RequestMapping("/login")
    @BusinessAnnotation(modelName = "系统管理",option = "登录")
    public String Login( UserInfo info, HttpSession session,HttpServletRequest request) throws Exception {
        //转换成MD5格式和数据库校验
        String md5 = MD5.getMd5(info.getUpwd());
        info.setUpwd(md5);
        UserInfo login = userInfoService.isLogin(info);
        //判断数据是否为空
        if(login!=null&&login.getUname()!=null){
            //当前登录用户保存到session中
            session.setAttribute("user",login);
            //动态加载权限
            List<Privilege> allPrivilege = getAllPrivilege(login.getUid());
           //保存session中
            session.setAttribute("privileges",allPrivilege);
            //获取ip地址
            String ipAddress = getIpAddress(request);
            //修改登录时间
            userInfoService.updateLastlogintime(new Date(),login.getUid(),ipAddress);
            return "/background/main";
        }else {
            return "/background/login";
        }
    }

    //获取ip地址
    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }


    @RequestMapping("/tologinOut")
    @BusinessAnnotation(modelName = "系统管理",option = "退出")
    public String tologinOut(){
        return "forward:/LoginOut";
    }

    //退出
    @RequestMapping("/LoginOut")
    public String loginOut(HttpSession session){
        //删除session信息
        session.removeAttribute("user");
        //返回登录页面
        return "/background/login";
    }

    //加载userList页面
    @RequestMapping("/UserList")
    public String goUserList(){
        return  "/background/userLists";
    }


    //获取全部用户信息
    @RequestMapping("/UserListJson")
    @ResponseBody
    @BusinessAnnotation(modelName = "系统管理",option = "用户列表")
    public Object getAll(@RequestParam(defaultValue = "") String unickname,@RequestParam(defaultValue = "1")int pageIndex,@RequestParam(defaultValue = "2")int pageSize) throws Exception {
        //查询信息保存到集合中
        Page<UserInfo> all = userInfoService.getAll(unickname,pageIndex,pageSize);
        return all;
    }

    //将所有用户信息导入Excel文件中
    @RequestMapping("/userInfoExcel")
    @BusinessAnnotation(modelName = "系统管理",option = "导出Excel")
    public String userInfoExcel(String userInfo) throws Exception {
        //获取所有用户信息
        List<UserInfo> userInfoExcel = userInfoService.getUserInfoExcel();

        //创建工作簿
        HSSFWorkbook workBook = new HSSFWorkbook();
        //创建工作表
        HSSFSheet sheet = workBook.createSheet("用户信息");
        //创建第一行
        HSSFRow row=null;
        row = sheet.createRow(0);
        //设置表头
        row.createCell(0).setCellValue("用户编号");
        row.createCell(1).setCellValue("真实姓名");
        row.createCell(2).setCellValue("昵称");
        row.createCell(3).setCellValue("密码");
        row.createCell(4).setCellValue("性别");
        row.createCell(5).setCellValue("电话");
        row.createCell(6).setCellValue("邮箱");
        row.createCell(7).setCellValue("身份证号");
        row.createCell(8).setCellValue("出生日期");

        //添加表数据
        int num=1;

        for (UserInfo item:userInfoExcel) {
            row=sheet.createRow(num);
            row.createCell(0).setCellValue(item.getUid());
            row.createCell(1).setCellValue(item.getUname());
            row.createCell(2).setCellValue(item.getUnickname());
            row.createCell(3).setCellValue(item.getUpwd());
            if(item.getUgender()=="0"){
                row.createCell(4).setCellValue("女");
            }else{
                row.createCell(4).setCellValue("男");
            }
            row.createCell(5).setCellValue(item.getUphone());
            row.createCell(6).setCellValue(item.getUemail());
            row.createCell(7).setCellValue(item.getUidentityid());
            row.createCell(8).setCellValue(item.getStrbirthday());
            num++;
        }

        workBook.write(new File("d:\\用户信息.xls"));

        workBook.close();//最后关闭工作簿
        return "redirect:/download";
    }

    //获取所有角色
    @RequestMapping("/RoleList")
    public String RoleList(Model mv) throws Exception {
        List<Role> allRole = iRoleService.getAllRole();
        mv.addAttribute("getRole",allRole);
        return "/background/form";
    }

    //根据id获取对象
    @RequestMapping("/GetUserInfo")
    public String getUserInfo(@RequestParam String uid, Model mv) throws Exception {
            //修改
            //获取userInfo对象
            UserInfo userInfo = userInfoService.getUserInfo(Integer.parseInt(uid));
            //获取所有角色
        List<Role> allRole = iRoleService.getAllRole();
        mv.addAttribute("getRole",allRole);
        mv.addAttribute("getUserInfo",userInfo);
        return "/background/form";
    }

    //根据id修改   新增
    @RequestMapping("/UpdateUser")
    @BusinessAnnotation(modelName = "系统管理",option = "修改用户")
    public String updateUser(UserInfo userInfo,Integer uid) throws Exception {
        //判断uid是否为空，如果为null则证明新增，否则修改
        if(uid==null){
            //MD5加密密码
            String md5 = MD5.getMd5(userInfo.getUpwd());
            userInfo.setUpwd(md5);
            userInfo.setLastAddress("北京");
            userInfo.setLastlogintime(new Date());
            //新增
            int i = userInfoService.addUser(userInfo);
        }else if(uid!=null&&uid>0){
            //修改
            int result = userInfoService.UpdateUser(userInfo);
        }
        //返回查询所有用户Controller
        return "forward:UserList";
    }

    //删除用户
    @RequestMapping("/deleteUser")
    @ResponseBody
    @BusinessAnnotation(modelName = "系统管理",option = "删除用户")
    public Object deleteUser(String [] check) throws Exception {
        if(check!=null){
            for (String str:check){
                userInfoService.deleteUser(Integer.parseInt(str));
            }
        }
        return  1;
    }

    /*后台数据校验*/
    @RequestMapping("/Validator")
    public String Validator(@Valid UserInfo userInfo, BindingResult br,Model model){
        if (br.getErrorCount()>0) {
            FieldError uname = br.getFieldError("uname");
            FieldError unickname = br.getFieldError("unickname");
            if(userInfo.getUid()==null){
                FieldError upwd=br.getFieldError("upwd");
                if (upwd != null) {
                    String upwdmsg = upwd.getDefaultMessage();
                    model.addAttribute("upwdmsg", upwdmsg);
                }
            }
            FieldError uemail = br.getFieldError("uemail");
            FieldError uphone = br.getFieldError("uphone");
            FieldError uidentityid = br.getFieldError("uidentityid");
            FieldError ubirhtday = br.getFieldError("ubirthday");

            //验证
            if (uname != null) {
                String unamemsg = uname.getDefaultMessage();
                model.addAttribute("unamemsg", unamemsg);
            }
            if (unickname != null) {
                String unicknamemsg = unickname.getDefaultMessage();
                model.addAttribute("unicknamemsg", unicknamemsg);
            }



            if (uemail != null) {
                String uemailmsg = uemail.getDefaultMessage();
                model.addAttribute("uemailmsg", uemailmsg);
            }
            if (uphone != null) {
                String uphonemsg = uphone.getDefaultMessage();
                model.addAttribute("uphonemsg", uphonemsg);
            }
            if (uidentityid != null) {
                String uidentityidmsg = uidentityid.getDefaultMessage();
                model.addAttribute("uidentityidmsg", uidentityidmsg);
            }
            if (ubirhtday != null) {
                String ubirhtdaymsg = ubirhtday.getDefaultMessage();
                model.addAttribute("ubirhtdaymsg", ubirhtdaymsg);
                System.out.println("sr");
            }

            //验证失败，返回注册页面
            model.addAttribute("getUserInfo",userInfo);
            return "/background/form";
        }

        System.out.println("校验成功");
            return "forward:UpdateUser";
    }

    //获取指定用户的所有权限集合 并且将权限集合  变成  有层级关系的集合
    public List<Privilege> getAllPrivilege(int uid){
        //新的容器 保存有父子关系的权限
        List<Privilege> rootMenus=new ArrayList<Privilege>();
        List<Privilege> privilegeList = iPrivilegeService.getAllPrivilege(uid);
        //将平级的权限  变成  有层级关系的权限集合
        for (Privilege item:privilegeList){
            Privilege childMenu=item;
            int pid = childMenu.getParent();
            if (pid==0){
                rootMenus.add(item);
            }else{
                for (Privilege innerMenu:privilegeList){
                    Integer id = innerMenu.getId();
                    if (id==pid){
                        Privilege parentMenu=innerMenu;
                        parentMenu.getChildren().add(childMenu);
                        break;
                    }
                }
            }
        }
        return rootMenus;
    }

    //获取所有权限集合
    @RequestMapping("/getPrivilege")
    @ResponseBody
    public List<Privilege> getPrivilege(String rid) throws Exception {
        //新的容器 保存有父子关系的权限
        List<Privilege> rootMenus=new ArrayList<Privilege>();
        //获取全部权限分类集合
        List<Privilege> privilegeList = iPrivilegeService.getPrivilege();
        //根据id获取当前用户的权限
        List<Privilege> rolePrivilege = iRoleService.getRolePrivilege(Integer.parseInt(rid));
        //将平级的权限  变成  有层级关系的权限集合
        for (Privilege item:privilegeList){
            int itemId = item.getId();
            for (Privilege list:rolePrivilege){
                //判断两个集合中是否有相同的id，如果有则让复选框选中
                if(itemId==list.getId()){
                    item.setChecked(true);
                }
            }
            Privilege childMenu=item;
            int pid = childMenu.getParent();
            //如果pid=0，则证明是一级分类
            if (pid==0){
                rootMenus.add(item);
            }else{
                for (Privilege innerMenu:privilegeList){
                    Integer id = innerMenu.getId();
                    //如果id=pid，则证明此id为pid的子级分类
                    if (id==pid){
                        Privilege parentMenu=innerMenu;
                        parentMenu.getChildren().add(childMenu);
                        break;
                    }
                }
            }
        }
        return rootMenus;
    }

    //下载
    @RequestMapping("/download")
    public ResponseEntity<byte[]> download() throws Exception {
        //获取下载的文件路径
        String path="d:\\用户信息.xls";
        File file=new File(path);
        HttpHeaders headers = new HttpHeaders();
        String fileName=new String("userInfo.xls".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }


    ExcelUtilTool<ExcelUserInfo> tool=new ExcelUtilTool<ExcelUserInfo>();
    //导入学员信息
    @RequestMapping("/importFile")
    public String importFile(MultipartFile file,HttpSession session){
        tool.setClazz(ExcelUserInfo.class);
        //判断是否为空文件
        if(file.getSize()>0){
            //获取文件名
            String filename = file.getOriginalFilename();
            //指定上传文件格式
            if (filename.endsWith("xls")||filename.endsWith("XLS")){
                //获取全路径
                String realPath = session.getServletContext().getRealPath("/Excel");
                //拼接全路径
                File files=new File(realPath,filename);
                //上传文件
                try {
                    file.transferTo(files);
                    //解析数据
                    List<ExcelUserInfo> userInfos = tool.ExcelToList(files);
                    System.out.println(userInfos);


                    //获取所有班级
                    List<Dictionary> dictionary = iDictionaryService.getDictionary();
                    UserInfo userInfo=null;
                    for (ExcelUserInfo item:userInfos){
                        userInfo=new UserInfo();
                        userInfo.setUname(item.getUname());
                        userInfo.setUnickname(item.getUnickname());
                        userInfo.setUemail(item.getUemail());
                        userInfo.setUphone(item.getUphone());
                        userInfo.setUidentityid(item.getUidentityid());
                        userInfo.setUbirthday(item.getUbirthday());

                        //将电话作为初始密码进行MD5加密
                        String md5 = MD5.getMd5(item.getUphone());
                        userInfo.setUpwd(md5);
                        if(item.getUgender().equals("男")||item.getUgender()=="男"){
                            userInfo.setUgender("0");
                        }else if (item.getUgender().equals("女")||item.getUgender()=="女"){
                            userInfo.setUgender("1");
                        }
                        //绑定班级
                        for (Dictionary dom:dictionary){
                            if (item.getUgradename().equals(dom.getDicdescribe())){
                                userInfo.setUgradeid(dom.getDicval());
                            }
                        }

                        userInfo.setLastAddress("北京");
                        userInfo.setLastlogintime(new Date());
                        userInfoService.addUser(userInfo);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else {
                //证明选择文件格式有误
                return "上传文件格式错误";
            }
        }else{
            //证明未选择文件
            return "请选择文件";
        }
        //添加成功
        return "/UserList";
    }


    public IPrivilegeService getiPrivilegeService() {
        return iPrivilegeService;
    }

    public void setiPrivilegeService(IPrivilegeService iPrivilegeService) {
        this.iPrivilegeService = iPrivilegeService;
    }

    public IUserInfoService getUserInfoService() {
        return userInfoService;
    }

    public void setUserInfoService(IUserInfoService userInfoService) {
        this.userInfoService = userInfoService;
    }

    public IDictionaryService getiDictionaryService() {
        return iDictionaryService;
    }

    public void setiDictionaryService(IDictionaryService iDictionaryService) {
        this.iDictionaryService = iDictionaryService;
    }
}
