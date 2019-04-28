package pramod.consultency.com.users.fragement;

import android.app.ProgressDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import pramod.consultency.com.users.R;
import pramod.consultency.com.users.app.RetrofitClient;
import pramod.consultency.com.users.model.Result;
import pramod.consultency.com.users.model.SharedPrefManager;
import pramod.consultency.com.users.model.User;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class Password_Change extends AppCompatActivity implements View.OnClickListener {

    private EditText currentpassword;
    private EditText  newpassword;
    private EditText  confirmpass;

    private Button button;
    private ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_password__change);
        getSupportActionBar().setTitle("Password Change");

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().getHeight();

        currentpassword = findViewById(R.id.current_password);
        newpassword  = findViewById(R.id.new_password);
        confirmpass = findViewById(R.id.confirm_pass);
        button =findViewById(R.id.change_password_button);
        button.setOnClickListener(this);
        progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Please wait...");

    }


    public boolean onOptionsItemSelected(MenuItem menuItem) {
        int id = menuItem.getItemId();

        if (id == android.R.id.home) {
            this.finish();
        }
        return super.onOptionsItemSelected(menuItem);
    }


    public void password_change()
    {
        final String currentpass = currentpassword.getText().toString().trim();
        final String newpass = currentpassword.getText().toString().trim();

        progressDialog.setMessage("Registering user...");
        progressDialog.show();
        User user = SharedPrefManager.getInstance(this).getUser();
        Call<Result> call = RetrofitClient.getInstance().getApi().password(user.getId(),currentpass, newpass);



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



    @Override
    public void onClick(View v) {

        password_change();

    }
}