package pramod.consultency.com.users.activities;

import android.app.ProgressDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
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
import pramod.consultency.com.users.app.RetrofitClient;
import pramod.consultency.com.users.model.Result;
import pramod.consultency.com.users.model.SharedPrefManager;
import pramod.consultency.com.users.model.User;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class Feeedback extends AppCompatActivity {


    private ProgressDialog progressDialog;
    private EditText  textmail;
    private EditText   textcommenet;

    private EditText   name1;
    private Button button;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_feeedback);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setTitle("FeedBack");

           textmail =(EditText)findViewById(R.id.editTextemail1);
           textcommenet=(EditText)findViewById(R.id.editcomment);
           name1 = findViewById(R.id.name_feed);

           button =(Button) findViewById(R.id.buttoncomm);
        progressDialog = new ProgressDialog(this);
           progressDialog.setMessage("Please wait...");

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                feedback();

            }
        });



    }


    public boolean onOptionsItemSelected(MenuItem menuItem)
    {    int id = menuItem.getItemId();

        if(id== android.R.id.home)
        {
            this.finish();
        }
        return super.onOptionsItemSelected(menuItem);
    }






    public void feedback()
    {

         final String email = textmail.getText().toString().trim();
        final String name = name1.getText().toString().trim();
         final String msg = textcommenet.getText().toString().trim();

             Log.d("email",email);
        Log.d("comment",msg);


        progressDialog.setMessage("send.....");
        progressDialog.show();
        User user = SharedPrefManager.getInstance(this).getUser();
        Call<Result> call = RetrofitClient.getInstance().getApi().feedback(user.getId(),email, name, msg);



        call.enqueue(new Callback<Result>() {
            @Override
            public void onResponse(Call<Result> call, Response<Result> response)
            {                                   System.out.println(response);
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









}
