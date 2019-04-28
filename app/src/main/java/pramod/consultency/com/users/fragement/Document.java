package pramod.consultency.com.users.fragement;


import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;


import pramod.consultency.com.users.R;
import pramod.consultency.com.users.activities.Registration;
import pramod.consultency.com.users.activities.Share;


public class Document extends Fragment implements View.OnClickListener{

       private Button download_button;
    private ProgressDialog progress;

    public Document() {

    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        return inflater.inflate(R.layout.fragment_document, container, false);
    }


    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        getActivity().setTitle(" Document Send");


        download_button =(Button) view.findViewById(R.id.dowunload);

        download_button.setOnClickListener(this);
        progress = new ProgressDialog(getActivity());
    }

    @Override
    public void onClick(View v) {

        Intent i = new Intent(getActivity(), Password.class);
        startActivity(i);
       // dialog();

    }


    private  void dialog()
    {

       // progress = new ProgressDialog(this);
        progress.setMax(100);
        progress.setMessage("Its Loading....");
        progress.setTitle("Downloading Document");
        progress.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
        progress.show();
        new Thread(new Runnable() {
            @Override
            public void run() {
                try{
                    while(progress.getProgress() <= progress.getMax()){
                        Thread.sleep(200);
                        handle.sendMessage(handle.obtainMessage());
                        if(progress.getProgress() == progress.getMax())
                        {
                            progress.dismiss();
                        }
                    }

                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }).start();


    }
    Handler handle = new Handler(){
        @Override
        public void handleMessage(Message msg){
            super.handleMessage(msg);
            progress.incrementProgressBy(1);
        }
    };



}

