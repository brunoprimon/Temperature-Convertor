package com.doignon.sylvain.temperatureconvertor;

import android.view.View;
import android.widget.EditText;

public class MyFocusWatcher implements View.OnFocusChangeListener {

    private EditText field;

    public MyFocusWatcher(EditText mfield) {
        field = mfield;
    }

    @Override
    public void onFocusChange(View v, boolean hasFocus) {
        if (hasFocus) {
            field.setText("");
        }
    }

}
