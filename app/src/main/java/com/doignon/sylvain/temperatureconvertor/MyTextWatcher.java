package com.doignon.sylvain.temperatureconvertor;

import android.text.Editable;
import android.text.TextWatcher;
import android.widget.EditText;

public class MyTextWatcher implements TextWatcher {

    private EditText targetField;
    private MainActivity mainActivity;

    public MyTextWatcher(EditText target, MainActivity mself) {
        targetField = target;
        mainActivity = mself;
    }

    // Some override
    @Override
    public void afterTextChanged(Editable s) {
    }

    @Override
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    // Code
    @Override
    public void onTextChanged(CharSequence s, int start, int before, int count) {
        if (!mainActivity.ignoreChanges) mainActivity.handler(s, targetField);
    }

}
