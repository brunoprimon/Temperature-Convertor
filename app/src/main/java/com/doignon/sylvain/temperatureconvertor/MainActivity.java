package com.doignon.sylvain.temperatureconvertor;

import android.icu.text.DecimalFormat;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    public boolean ignoreChanges = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        // Default
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Vars
        EditText cel = (EditText) findViewById(R.id.cel);
        EditText far = (EditText) findViewById(R.id.far);

        //Tags
        cel.setTag("cel");
        far.setTag("far");

        // Listeners for changes
        cel.addTextChangedListener(new MyTextWatcher(far, this));
        far.addTextChangedListener(new MyTextWatcher(cel, this));

        // Listeners for focus
        cel.setOnFocusChangeListener(new MyFocusWatcher(cel));
        far.setOnFocusChangeListener(new MyFocusWatcher(far));

    }

    private static Double cel2far(Double celsius) {
        return (celsius * (9 / 5.0) + 32);
    }

    private static Double far2cel(Double fahrenheit) {
        return ((fahrenheit - 32) * (5 / 9.0));
    }

    private static double roundTwoDecimals(double d) {
        DecimalFormat twoDForm = new DecimalFormat("#.##");
        String ss = twoDForm.format(d).replace(",", ".");
        return Double.valueOf(ss);
    }

    public void setText(String text, EditText targetField) {
        ignoreChanges = true;
        targetField.setText(text);
        ignoreChanges = false;
    }

    public void handler(CharSequence s, EditText targetField) {
        if (s.length() == 0) {
            setText("", targetField);
            return;
        }
        Double number;
        boolean wantRounded = true;
        if (s.toString().contains("."))
            wantRounded = false;
        try {
            number = Double.parseDouble(s.toString());
        } catch (Exception e) {
            setText("", targetField);
            return;
        }
        if (targetField.getTag() == "cel")
            number = far2cel(number);
        else
            number = cel2far(number);
        String result;
        if (wantRounded) {
            int n = (int) Math.round(number);
            result = String.valueOf(n);
        } else {
            number = roundTwoDecimals(number);
            result = String.valueOf(number);
        }
        setText(result, targetField);
    }

}
