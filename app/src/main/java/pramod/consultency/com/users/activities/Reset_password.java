package pramod.consultency.com.users.activities;

import android.app.ProgressDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.util.Patterns;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;


import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;


import pramod.consultency.com.users.R;
//import pramod.consultency.com.users.app.RequestHandler;

public class Reset_password extends AppCompatActivity {
    private EditText reset_pass;
    private Button  restbutton;
    private ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reset_password);
       getSupportActionBar().setTitle("Rest Password");
       getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setHomeButtonEnabled(true);

        reset_pass = (EditText)findViewById(R.id.forgetuser);
        restbutton =(Button)findViewById(R.id.rest_Button);
        progressDialog = new ProgressDialog(this);
        //progressDialog.s(ColorStateList.valueOf(Color.RED));
        progressDialog.setMessage("Please wait...");


        restbutton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                restpassword();
            }
        });



    }





    public void restpassword()
    {
        final String forgetpass = reset_pass.getText().toString().trim();



        if (!Patterns.EMAIL_ADDRESS.matcher(forgetpass).matches()) {
            reset_pass.setError("Enter a valid email");
            reset_pass.requestFocus();
            return;
        }





        Log.d("forgetpass",forgetpass);

        progressDialog.show();

      /*  StringRequest stringRequest = new StringRequest(
                Request.Method.POST, Constants.URL_LOGIN,new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                System.out.println("india"+response);
                Toast.makeText(getApplicationContext(), response, Toast.LENGTH_LONG).show();
                Log.d("response",response);
                progressDialog.dismiss();
                try {
                    JSONObject obj = new JSONObject("test"+response);

                     Toast.makeText(getApplicationContext(), obj.getString("response"), Toast.LENGTH_LONG).show();




                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        progressDialog.dismiss();

                        Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_LONG).show();
                    }
                }
        ) {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("forgetpass", forgetpass);

                return params;
            }

        };

        RequestHandler.getInstance(this).addToRequestQueue(stringRequest);*/


    }

}
