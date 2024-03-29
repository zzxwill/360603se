package IP;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class GetLocalIpAddress {
	
	public String getLocalIpAddress() {
	    try {
	        for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();) {
	            NetworkInterface intf = en.nextElement();
	            for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
	                InetAddress inetAddress = enumIpAddr.nextElement();
	                if (!inetAddress.isLoopbackAddress()) {
	                    return inetAddress.getHostAddress().toString()+ "-" +getIpAddr()+"-";
	                }
	            }
	        }
	    }catch (Exception e) {
            e.printStackTrace();
        }
        return getIpAddr();
	}
	
	public String getIpAddr() {
		Enumeration allNetInterfaces = null;  
        try {  
            allNetInterfaces = NetworkInterface.getNetworkInterfaces();  
        } catch (java.net.SocketException e) {  
            e.printStackTrace();  
        }  
        InetAddress ip = null;  
        while (allNetInterfaces.hasMoreElements())  
        {  
            NetworkInterface netInterface = (NetworkInterface) allNetInterfaces  
                    .nextElement();  
            System.out.println(netInterface.getName());  
            Enumeration addresses = netInterface.getInetAddresses();  
            while (addresses.hasMoreElements())  
            {  
                ip = (InetAddress) addresses.nextElement();  
                if (ip != null && ip instanceof Inet4Address)  
                {   
                	return ip.getHostAddress();
                   
                }  
            }  
        }
        return null;
	}
	
	/*
	public String getWifiIpAddress() {
        WifiManager wifiManager = (WifiManager) getSystemService(WIFI_SERVICE);
        WifiInfo wifiInfo = wifiManager.getConnectionInfo();
        // 获取32位整型IP地址
        int ipAddress = wifiInfo.getIpAddress();
        
        //返回整型地址转换成“*.*.*.*”地址
        return String.format("%d.%d.%d.%d",
                (ipAddress & 0xff), (ipAddress >> 8 & 0xff),
                (ipAddress >> 16 & 0xff), (ipAddress >> 24 & 0xff));
    }
	*/
	 public String getIP4(HttpServletRequest request){
	        String ip = request.getHeader("x-forwarded-for");
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	            ip = request.getHeader("Proxy-Client-IP");
	        }
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	            ip = request.getHeader("WL-Proxy-Client-IP");
	        }
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	            ip = request.getRemoteAddr();
	        }
	        return ip;
	    }
	 
	 //InetAddress inet = InetAddress.getLocalHost();
	//  System.out.println("ip=" + inet.getHostAddress());

}
