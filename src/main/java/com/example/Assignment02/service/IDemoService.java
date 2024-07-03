package com.example.Assignment02.service;

import com.example.Assignment02.entity.Demo;
import com.example.Assignment02.form.Updateform;

import java.io.IOException;

public interface IDemoService {
    Demo getById(long i);

    void update(Updateform updateform) throws IOException;
}
