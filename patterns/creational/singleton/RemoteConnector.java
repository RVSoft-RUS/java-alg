package singleton;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

public final class RemoteConnector implements Externalizable {
    private static volatile RemoteConnector instance;
    private final String info = "использование volatile модификатора может привести" +
            " к проблемам производительности на мультипроцессорных системах";

    private RemoteConnector() {
    }

    public static RemoteConnector getInstance() {
        if (instance == null) {
            synchronized (RemoteConnector.class) {
                if (instance == null) {
                    instance = new RemoteConnector();
                }
            }
        }
        return instance;
    }

    @Override
    public void writeExternal(ObjectOutput out) throws IOException {
        throw new UnsupportedOperationException("Hren Vam!");
    }

    @Override
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        throw new UnsupportedOperationException("Hren Vam!");
    }
}
