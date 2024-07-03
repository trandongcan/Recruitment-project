package com.example.Assignment02.service.impl;

import com.example.Assignment02.entity.ApplyPosts;
import com.example.Assignment02.entity.Cv;
import com.example.Assignment02.entity.Recruitment;
import com.example.Assignment02.entity.User;
import com.example.Assignment02.repository.IApplyPostsRepository;
import com.example.Assignment02.repository.ICvRepository;
import com.example.Assignment02.repository.IRecruitmentRepository;
import com.example.Assignment02.repository.IUserRepository;
import com.example.Assignment02.service.IApplyPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class ApplyPostService implements IApplyPostService {

    @Autowired
    private IApplyPostsRepository applyPostsRepository;

    @Autowired
    private IRecruitmentRepository recruitmentRepository;

    @Autowired
    private IUserRepository userRepository;

    @Autowired
    private ICvRepository cvRepository;

    public final  String UPLOAD_DIRECTORY_CV = System.getProperty("user.dir") + "/src/main/resources/static/assets/upload_files/";




    @Override
    public List<ApplyPosts> getAllApplyPost() {
        return applyPostsRepository.findAll();
    }

    @Override
    public Page<ApplyPosts> findAllUser(Pageable pageable) {
        return applyPostsRepository.findAll(pageable);
    }

    @Override
    public String applyJob(int idRe, String text, int idUser, MultipartFile file) throws IOException {
        ApplyPosts applyPosts = new ApplyPosts();

        // Set gía trị cho Recruitment
        Optional<Recruitment> optional = recruitmentRepository.findById(idRe);
        if (!optional.isPresent())
            throw new RuntimeException("IdRe not found");
        applyPosts.setRecruitment(optional.get());
        applyPosts.setText(text);

        // Set gía trị cho User
        Optional<User> optionalUser = userRepository.findById(idUser);
        if (!optionalUser.isPresent())
            throw new RuntimeException("IdUser not found");
        applyPosts.setUser(optionalUser.get());
        applyPosts.setStatus(0);

        //ktra xem da ung tuyen chua
        ApplyPosts ap = applyPostsRepository.findByUserIdAndRecruitmentId(idUser, idRe);
        if (Objects.nonNull(ap))
            return "false";

        //TH1: fiel null dùng mac dinh
        //TH2 : file có thì upload  file + ở appy_post  dẻ ten file vua upload
        if (Objects.isNull(file)){
            Cv cv = cvRepository.findByUserId(idUser);
            applyPosts.setNameCv(cv.getFileName());
            applyPosts.setCreatedAt(String.valueOf(LocalDate.now()));
            applyPostsRepository.save(applyPosts);
            return "true";
        }else {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HHmmss");//abc.jpg
            Path fileNameAndPath = Paths.get(UPLOAD_DIRECTORY_CV, optionalUser.get().getFullName() + simpleDateFormat.format(new Date())+".pdf");
            Files.write(fileNameAndPath, file.getBytes());//  ghi file vao thu muc tuong ung

            applyPosts.setNameCv(simpleDateFormat.format(new Date())+".pdf");
            applyPosts.setCreatedAt(String.valueOf(LocalDate.now()));
            applyPostsRepository.save(applyPosts);
            return "true";
        }

    }

    @Override
    public ApplyPosts getApplyJobById(int id) {
        Optional<ApplyPosts> optional = applyPostsRepository.findById(id) ;
        if (!optional.isPresent()){
           throw new RuntimeException("Not Found ID :" + id) ;
        }
        return optional.get();
    }


}
