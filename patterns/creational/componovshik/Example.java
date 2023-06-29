package componovshik;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Example {
    public static void main(String[] args) {
        HardDisk disk1 = new HardDisk(50);
        HardDisk disk2 = new HardDisk(60);
        Server server1 = new Server(disk1, disk2);

        HardDisk disk3 = new HardDisk(56);
        HardDisk disk4 = new HardDisk(68);
        Server server2 = new Server(disk3, disk4);

        ServerRack serverRack = new ServerRack(server1, server2);
        DataCenter dataCenter = new DataCenter(serverRack);

        System.out.println(dataCenter.getVolume());
    }
}
interface Storage {
    int getVolume();
}
class HardDisk implements Storage {
    private int volume;

    public HardDisk(int volume) {
        this.volume = volume;
    }

    @Override
    public int getVolume() {
        return volume;
    }
}
class Server implements Storage {
    private List<Storage> list = new ArrayList<>();

    public Server(Storage... value) {
        this.list.addAll(Arrays.asList(value));
    }

    @Override
    public int getVolume() {
        return list.stream().mapToInt(Storage::getVolume).sum();
    }
}
class ServerRack implements Storage {
    private List<Storage> list = new ArrayList<>();

    public ServerRack(Storage... value) {
        this.list.addAll(Arrays.asList(value));
    }

    @Override
    public int getVolume() {
        return list.stream().mapToInt(Storage::getVolume).sum();
    }
}
class DataCenter implements Storage {
    private List<Storage> list = new ArrayList<>();

    public DataCenter(Storage... value) {
        this.list.addAll(Arrays.asList(value));
    }

    @Override
    public int getVolume() {
        return list.stream().mapToInt(Storage::getVolume).sum();
    }
}
