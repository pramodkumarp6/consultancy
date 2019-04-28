package pramod.consultency.com.users.fragement;


import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Patterns;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import pramod.consultency.com.users.R;
import pramod.consultency.com.users.app.RetrofitClient;
import pramod.consultency.com.users.model.LoginResponse;
import pramod.consultency.com.users.model.Result;
import pramod.consultency.com.users.model.SharedPrefManager;
import pramod.consultency.com.users.model.User;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * A simple {@link Fragment} subclass.
 */
public class Home extends Fragment implements View.OnClickListener {

    private EditText editTextEmail;
    private  EditText editTextName;
    private  EditText editmobile;
    private ProgressDialog progressDialog;

    private Button button;

    public Home() {

    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        return inflater.inflate(R.layout.fragment_home, container, false);

    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        getActivity().setTitle("Profile");


        editTextName =(EditText) view.findViewById(R.id.editname);
       // editmobile.setEnabled(false);
        editTextEmail =(EditText) view.findViewById(R.id.editemail);
       // editTextEmail.setEnabled(false);
        editmobile =(EditText) view.findViewById(R.id.editmob);
        progressDialog = new ProgressDialog(getActivity());

        progressDialog.setMessage("Please wait...");



        button =(Button) view.findViewById(R.id.save_button);

        button.setOnClickListener(this);



        User user = SharedPrefManager.getInstance(getActivity()).getUser();

        editTextName.setText(user.getName());
        editTextEmail.setText(user.getEmail());
        editmobile.setText(user.getMobile());



    }


    private void updateProfile() {

        String name = editTextName.getText().toString().trim();
        String email = editTextEmail.getText().toString().trim();
        String mobile = editmobile.getText().toString().trim();


        if (name.isEmpty()) {
            editTextEmail.setError("Email is required");
            editTextEmail.requestFocus();
            return;
        }

        if (!Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
            editTextEmail.setError("Enter a valid email");
            editTextEmail.requestFocus();
            return;
        }

        if (mobile.length() < 10)  {
            editmobile.setError("Enter valid Mobile");
            editmobile.requestFocus();
            return;
        }

        progressDialog.setMessage(" Update user profile...");
        progressDialog.show();
           User user = SharedPrefManager.getInstance(getActivity()).getUser();
        Call<Result> call = RetrofitClient.getInstance()
                .getApi().updateUser(user.getId(),email,name, mobile);
         progressDialog.onStart();
        call.enqueue(new Callback<Result>() {
            @Override
            public void onResponse(Call<Result> call, Response<Result> response) {

                Toast.makeText(getActivity(), response.body().getMessage(), Toast.LENGTH_LONG).show();

                if (!response.body().getError()) {
                    SharedPrefManager.getInstance(getActivity()).saveUser(response.body().getUser());
                    //progressDialog.hide();
                }

            }

            @Override
            public void onFailure(Call<Result> call, Throwable t) {
                progressDialog.hide();
            }
        });





    }

    @Override
    public void onClick(View v) {

        //Intent  intent = new Intent (getContext(),Password.class);
         //startActivity(intent);

        updateProfile();

    }
}
