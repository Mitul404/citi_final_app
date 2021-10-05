def lstmpred(stock,n_days):
    from keras.models import Sequential
    from keras.layers import LSTM
    from keras.layers import Dense
    from keras.layers import Dropout
    import numpy as np
    import yfinance as yf
    from sklearn.model_selection import train_test_split
    from datetime import datetime as dt
    import pandas as pd
    import plotly.graph_objs as go
    import plotly.express as px
    from datetime import date, timedelta
    from sklearn import metrics
    
    df = yf.download(stock, period='2y')
    df.reset_index(inplace=True)
    # print(df.shape)
    df['Day'] = df.index

    days = list()
    for i in range(len(df.Day)):
        days.append([i])

    # Splitting the dataset

    X = df['Day'].values.reshape(-1,1)
    #X=days
    Y = df[['Close']]
    ###########################################
    from sklearn.preprocessing import MinMaxScaler
    scaler=MinMaxScaler(feature_range=(0,1))
    Y=scaler.fit_transform(np.array(Y).reshape(-1,1))
    ################################################
    # print(Y)
    x_train, x_test, y_train, y_test = train_test_split(X,
                                                        Y,
                                                        test_size=0.2,
                                                        shuffle=False)
    ###############################################
    import numpy 
    # convert an array of values into a dataset matrix
    def create_dataset(dataset, time_step=1):
        dataX, dataY = [], []
        for i in range(len(dataset)-time_step-1):
            a = dataset[i:(i+time_step), 0]   ###i=0, 0,1,2,3-----99   100 
            dataX.append(a)
            dataY.append(dataset[i + time_step, 0])
        return numpy.array(dataX), numpy.array(dataY)
    time_step = 10
    X_tr_tf, y_tr_tf = create_dataset(y_train, time_step)
    X_te_tf, y_te_tf = create_dataset(y_test, time_step)
    # print (X_te_tf.shape)

    X_tr_tf =X_tr_tf.reshape(X_tr_tf.shape[0],X_tr_tf.shape[1] , 1)
    X_te_tf = X_te_tf.reshape(X_te_tf.shape[0],X_te_tf.shape[1] , 1)

    from tensorflow.keras.models import Sequential
    from tensorflow.keras.layers import Dense
    from tensorflow.keras.layers import LSTM


    model=Sequential()
    model.add(LSTM(50,return_sequences=True,input_shape=(time_step,1)))
    model.add(LSTM(50,return_sequences=True))
    model.add(LSTM(50))
    model.add(Dense(1))
    model.compile(loss='mean_squared_error',optimizer='adam')
    # model.summary()

    model.fit(X_tr_tf,y_tr_tf,validation_data=(X_te_tf,y_te_tf),epochs=20,batch_size=8,verbose=1)

    x_input=Y[-time_step-1:].reshape(1,-1)
    temp_input=list(x_input)
    temp_input=temp_input[0].tolist()


    #test_predict=model.predict(output_days)

    from numpy import array

    lst_output=[]
    n_steps=5
    i=0
    while(i<=n_days):
        
        if(len(temp_input)>5):
            #print(temp_input)
            x_input=np.array(temp_input[1:])
            # print("{} day input {}".format(i,x_input))
            x_input=x_input.reshape(1,-1)
            x_input = x_input.reshape((1, time_step, 1))
            #print(x_input)
            yhat = model.predict(x_input, verbose=0)
            # print("{} day output {}".format(i,yhat))
            temp_input.extend(yhat[0].tolist())
            temp_input=temp_input[1:]
            #print(temp_input)
            lst_output.extend(yhat.tolist())
            i=i+1
        else:
            x_input = x_input.reshape((1, n_steps,1))
            yhat = model.predict(x_input, verbose=0)
            # print(yhat[0])
            temp_input.extend(yhat[0].tolist())
            # print(len(temp_input))
            lst_output.extend(yhat.tolist())
            i=i+1
        

    # print(lst_output)

    ######################################3
    #model = estimator.fit(y_train)
    #y_forecast = model.forecast(steps=n_days)
    output_days = list()
    for i in range(1, n_days):
        output_days.append([i + x_test[-1][0]])
    #print(output_days)

    dates = []
    current = date.today()
    output=np.squeeze(scaler.inverse_transform(lst_output).reshape(1,-1))
    for i in range(n_days):
        current += timedelta(days=1)
        dates.append(current)
    fig = go.Figure()
    fig.add_trace(
        go.Scatter(
            x=dates,  # np.array(ten_days).flatten(), 
            y=output,
            mode='lines+markers',
            name='data'))
    fig.update_layout(
        title="Predicted Close Price of next " + str(n_days ) + " days using LSTM",
        xaxis_title="Date",
        yaxis_title="Closed Price")



    return fig