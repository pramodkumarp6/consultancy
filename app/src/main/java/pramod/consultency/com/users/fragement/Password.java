package pramod.consultency.com.users.fragement;

import android.app.ProgressDialog;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import pramod.consultency.com.users.R;
import pramod.consultency.com.users.app.RetrofitClient;
import pramod.consultency.com.users.model.DefaultResponse;
import pramod.consultency.com.users.model.SharedPrefManager;
import pramod.consultency.com.users.model.User;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class Password extends Fragment implements View.OnClickListener {
    private EditText editTextCurrentPassword;
    private EditText editTextNewPassword;
    private EditText confirm;
    private Button change_button;
    private ProgressDialog progressDialog;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {


        return inflater.inflate(R.layout.fragment_password, container, false);
    }


    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        getActivity().setTitle("Password Change");
        change_button =(Button) view.findViewById(R.id.change_password_button);

        change_button.setOnClickListener(this);
        progressDialog = new ProgressDialog(getActivity());

        progressDialog.setMessage("Please wait...");

        editTextCurrentPassword =(EditText) view.findViewById(R.id.current_password);
        editTextNewPassword =(EditText) view.findViewById(R.id.new_password);
        editTextNewPassword =(EditText) view.findViewById(R.id.confirm_pass);
    }


    private void  update_password() {
        String currentpassword = editTextCurrentPassword.getText().toString().trim();
        String newpassword = editTextNewPassword.getText().toString().trim();
        String pass_confirm = editTextNewPassword.getText().toString().trim();


        if (currentpassword.isEmpty()) {
            editTextCurrentPassword.setError("Password required");
            editTextCurrentPassword.requestFocus();
            return;
        }

        if (newpassword.length() < 8) {
            editTextNewPassword.setError("Password required");
            editTextNewPassword.requestFocus();
            return;
        }

        if (!pass_confirm.equals(newpassword)) {
            editTextNewPassword.setError("Confirm is Not match");
            editTextNewPassword.requestFocus();
            return;

        }

     /*   User user = SharedPrefManager.getInstance(getActivity()).getUser();
        Call<DefaultResponse> call = RetrofitClient.getInstance().getApi()
                .updatePassword(currentpassword, newpassword, user.getEmail());

        call.enqueue(new Callback<DefaultResponse>() {
            @Override
            public void onResponse(Call<DefaultResponse> call, Response<DefaultResponse> response) {

             //   Toast.makeText(getActivity(), response.body().getMsg(), Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Call<DefaultResponse> call, Throwable t) {
                progressDialog.hide();
            }
        });*/

    }



    @Override
    public void onClick(View v) {
        update_password();
    }
}