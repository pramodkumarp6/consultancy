package pramod.consultency.com.users.activities;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;


import android.app.ProgressDialog;
import android.content.Intent;
import android.util.Patterns;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;


import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import pramod.consultency.com.users.R;

import pramod.consultency.com.users.app.RetrofitClient;
import pramod.consultency.com.users.model.DefaultResponse;
import pramod.consultency.com.users.model.Result;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class Registration extends AppCompatActivity {


    private EditText   editemail;
    private EditText    editPass;
    private EditText     editconfirm_pass;
    private EditText   editmobile;
    private ProgressDialog progressDialog;
    private  Button  Reg;
    private EditText user_name;
    private TextView textViewLogin;
   // private Boolean status = true;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration);



        progressDialog = new ProgressDialog(this);

        progressDialog.setMessage("Please wait...");

        getSupportActionBar().setTitle("Registration");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        user_name = (EditText) findViewById(R.id.name);
        editemail = (EditText) findViewById(R.id.editTextemail);
        editPass = (EditText) findViewById(R.id.editTextPassword1);
        editconfirm_pass = (EditText) findViewById(R.id.editTextPassword2);
        editmobile = (EditText) findViewById(R.id.mob);
        textViewLogin=(TextView)findViewById(R.id.textViewLogin1) ;

        Reg=  (Button)findViewById(R.id.buttonRegister);

        Reg.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                register();
            }
        });



        textViewLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
               Intent intent = new Intent(Registration.this,Login.class);
                startActivity(intent);
            }
        });







        //progressDialog = new ProgressDialog(this);
       // progressDialog.setMessage("Please wait...");


    }

    public boolean onOptionsItemSelected(MenuItem menuItem)
    {    int id = menuItem.getItemId();

        if(id== android.R.id.home)
        {
            this.finish();
        }
        return super.onOptionsItemSelected(menuItem);
    }

    public void register()
    {
       // final ProgressDialog progressDialog = new ProgressDialog(this);
      //  progressDialog.setMessage("Registration...");
      //  progressDialog.show();
        final String  name =   user_name.getText().toString().trim();
        final String  email = editemail.getText().toString().trim();
        final String  password = editPass.getText().toString().trim();
        final String  pass_confirm= editconfirm_pass.getText().toString().trim();
        final String  mobile = editmobile.getText().toString().trim();


        if (name.length() <3) {
            user_name.setError("Name  is required ");
            user_name.requestFocus();
            return;
        }

           if (mobile.length() < 10)  {
               editmobile.setError("Enter valid Mobile");
               editmobile.requestFocus();
                return;
            }

            if (!Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
                editemail.setError("Enter a valid email");
                editemail.requestFocus();
                return;
            }

            if (password.length() < 8) {
                editPass.setError("Password required");
                editPass.requestFocus();
                return;
            }

            if (! pass_confirm.equals(password)  )   {
                editconfirm_pass.setError("Confirm is Not match");
                editconfirm_pass.requestFocus();
                return;

            }


           /* Log.d(useremail,"useremail");
            Log.d(userPassword,"userPassword");
            Log.d(userConfirm,"userConfirm");
            Log.d(userMobile,"userMobile");*/


       progressDialog.setMessage("Registering user...");
        progressDialog.show();

        Call<Result> call = RetrofitClient.getInstance().getApi().createUser(email, password, name, mobile);


        call.enqueue(new Callback<Result>() {
            @Override
            public void onResponse(Call<Result> call, Response<Result> response)
            {
                progressDialog.dismiss();

                Toast.makeText(getApplicationContext(), response.body().getMessage(), Toast.LENGTH_LONG).show();


            }

            @Override
            public void onFailure(Call<Result> call, Throwable t) {
                progressDialog.dismiss();
                Toast.makeText(getApplicationContext(), t.getMessage(), Toast.LENGTH_LONG).show();
            }
        });


    }


    public void onClick(View view) {

    }


}
