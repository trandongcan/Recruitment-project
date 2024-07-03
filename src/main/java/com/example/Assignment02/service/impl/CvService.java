package com.example.Assignment02.service.impl;

import com.example.Assignment02.dto.UserLoginDTO;
import com.example.Assignment02.entity.Cv;
import com.example.Assignment02.entity.User;
import com.example.Assignment02.form.UploadFileCvForm;
import com.example.Assignment02.repository.ICvRepository;
import com.example.Assignment02.repository.IUserRepository;
import com.example.Assignment02.service.ICvService;
import com.example.Assignment02.service.IUserService;
import com.example.Assignment02.utils.ContextUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

@Service
public class CvService implements ICvService {
    @Autowired
    private IUserRepository userRepository;

    @Autowired
    private ICvRepository cvRepository;

    @Autowired
    private IUserService userService;

    @Autowired
    private ContextUtils contextUtils;
    public final  String UPLOAD_DIRECTORY_CV = System.getProperty("user.dir") + "/src/main/resources/static/assets/upload_files/";


    @Override
    public String uploadCvUser(UploadFileCvForm  form, MultipartFile file) throws IOException {
        UserLoginDTO userLoginDTO = (UserLoginDTO) contextUtils.getUserLogin();
        User user = userRepository.findById(userLoginDTO.getId()).get();

        Optional<Cv> optional = cvRepository.findById(userLoginDTO.getId());
        if (!optional.isPresent()){
            Cv cv1 = new Cv();
            cv1.setFileName(createFileName(file));
            cv1.setUserId(user.getId());
            cvRepository.save(cv1);
            user.setCv(cv1);
            userRepository.save(user);
            return cv1.getFileName();

        }else {
            Cv cv = optional.get();
            Path fileNameAndPath = Paths.get(UPLOAD_DIRECTORY_CV,createFileName(file));
            Files.write(fileNameAndPath, file.getBytes());//  ghi file vao thu muc tuong ung

            cv.setFileName(createFileName(file));
            cvRepository.save(cv);
            user.setCv(cv);
            userRepository.save(user);
            return cv.getFileName();
        }
    }

    private String createFileName( MultipartFile file){
        UserLoginDTO userLoginDTO = (UserLoginDTO) contextUtils.getUserLogin();
        User user = userRepository.findById(userLoginDTO.getId()).get();

        String[] arr = file.getOriginalFilename().split("\\.");
        String tailImg = "";
        if (arr.length > 0)
            tailImg = arr[arr.length - 1];

        String[] arr1 = user.getFullName().split("@");
        String fileName = "";
        if (arr1.length > 0)
            fileName = arr1[0];

        return fileName + "." + tailImg;
    }


    @Override
    public void deleteCvById(int id){
        User user = userRepository.findByCvId(id);
        user.setCv(null);
        userRepository.save(user);
        cvRepository.deleteById(id);
    }

}
