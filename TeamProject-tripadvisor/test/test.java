@Controller
public class MainController{

    @RequestMapping(value = "/", method = ReqeustMethod.Get)
    public String mainPage(){

        return "common/main";
    }

}

@Controller
@SessionAttributes({"loginMember", "message", "test2"})
public class MemberController{

    @Autowired
    private MemberService service;

    @PostMapping("/member/login")
    public String login(Member inputMember, Model model, RedirectAttributes ra, 
            @RequestParam(value = "saveId", required = false) String saveId, 
            HttpServletResponse resp, @RequestHeader(value = "referer") String referer){

                Member loginMember = service.login(inputMember);

                String path = null;

                if (loginMember != null){

                    path = "/";

                    model.addAttribute("loginMember", loginMember);
                    
                    Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());

                    if(saveId != null){

                        cookie.setMaxAge(60*60*24*365);

                    } else {

                        cookie.setMaxAge(0);
                    }

                    cookie.setPath("/");

                    resp.addCookie(cookie);

                } else {

                    path = referer;

                }

        return "redirect:" + path;
    }

    @GetMapping("/member/login")
    public String loginPage(){

        return "member/login";
    }

    @GetMapping("/member/logout")
    public String logout(SessionStatus status){

        status.setCoplete();

        return "redirect:/"
    }

}

public interface MemberService {

    public abstract Member login(Member inputMember);

}

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO dao;

    @Autowired
    private BCryptPasswordEncoder bcrypt;

    @Override
    public Member login(Member inputMember) {
        
        Member loginMember = dao.login(inputMember.getMemberEmail());

        if (loginMember != null){

            if (bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())){

                loginMember.setMemberPw(null);

            } else {

                loginMember = null;
            }

        }

        return loginMember;

    }

}

@Repository
public class MemberDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public Member login(String memberEamil){

        return sqlSession.selectOne("memberMapper.login", memberEmail);

    }

}