package com.codecool.web.model;

import java.util.Objects;

public class Work extends AbstractModel {

    private String title;
    private String content;
    private String written;

    public Work(int id, String title, String content, String written) {
        super(id);
        this.title = title;
        this.content = content;
        this.written = written;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getWritten() {
        return written;
    }
}