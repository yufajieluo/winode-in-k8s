# set parameters
# kubectl version | grep "Server Version" | awk '{print $3}'
$version_k8s = "1.28.5"
# kubectl -n kube-system get deployment calico-kube-controllers -o=jsonpath='{.spec.template.spec.containers[0].image}' | cut -d':' -f2
$version_calico = "v3.26.4"
$dns_server = "169.254.25.10"
# kubectl cluster-info dump | grep service-cluster-ip-range | head -n 1 | awk -F= '{print $2}' | sed 's/",//g'
$cluster_cidr = "10.233.0.0/24"
# base64 encode for kubeconfig 
$kubeconfig_content_encode = "YXBpVmVyc2lvbjogdjEKY2x1c3RlcnM6Ci0gY2x1c3RlcjoKICAgIGNlcnRpZmljYXRlLWF1dGhvcml0eS1kYXRhOiBMUzB0TFMxQ1JVZEpUaUJEUlZKVVNVWkpRMEZVUlMwdExTMHRDazFKU1VSQ1ZFTkRRV1V5WjBGM1NVSkJaMGxKWm5CaGF6UlBVVkY2TlUxM1JGRlpTa3R2V2tsb2RtTk9RVkZGVEVKUlFYZEdWRVZVVFVKRlIwRXhWVVVLUVhoTlMyRXpWbWxhV0VwMVdsaFNiR042UVdWR2R6QjVUa1JCTVUxVVRYaE5hbEV5VFhwS1lVWjNNSHBPUkVFeFRWUkZlRTFxVlhoTmVrcGhUVUpWZUFwRmVrRlNRbWRPVmtKQlRWUkRiWFF4V1cxV2VXSnRWakJhV0UxM1oyZEZhVTFCTUVkRFUzRkhVMGxpTTBSUlJVSkJVVlZCUVRSSlFrUjNRWGRuWjBWTENrRnZTVUpCVVVOMUsyeGpjRkJXYml0ellsaFBabGt6ZEROR2VEQlZaa2ROZW1GM1RFeFdSM1JIU2tOc2JrUndPRkpqTnpSMWMycGthR05XS3pCa01td0tUa1l3WkhwNFRrMVFkVFY0SzI0dllsQjNabmRLYzBKQlJrcHlNQ3RwTkVaNVdEUmpXSEJsU1ZOSlkwMURUVU5DYkhoSWRqRnFiRmhxZWtZMFUydDVad3A1VGtkeVRuSjVhVGg1ZWtkVmRWVmxaR3hGVVZGdU5tbHpjaXRIUmtKelZsaFFUMGxKYVdoNGFETjVjMFZpU0UxVU1qQkZNakZPVjJORFpXY3dVMU5qQ2xWS2JrVjFjSFpSVm14Vk1VOU1abUZZVjNkTlRIcEtOVU5GY1RZdlZVbFhPRzVvU1c4NWEwOTVlVm8zTVhWTWR6TXhjRlUzV0d4d1ZtaHRjbEJ5V1dNS1QwMW1hWEZDYTB0cVUxZEhUMDVyTld4d1ZrdHFia3B5VEdFeWFEWkxXREI1ZG1zclNIVnVPVlFyVEN0a016QXlObXhNUjFWS2FEQnhVMjA1ZWxwWE5RcERaMms1V1d4TVdUbHRXWE5hVUc4MVEzUkNibkpQZFVkMWJDOWtRV2ROUWtGQlIycFhWRUpZVFVFMFIwRXhWV1JFZDBWQ0wzZFJSVUYzU1VOd1JFRlFDa0puVGxaSVVrMUNRV1k0UlVKVVFVUkJVVWd2VFVJd1IwRXhWV1JFWjFGWFFrSlNVMEkwYkRaT1drSXlURlpDV2xWVFZuZFpjamhEVTJONVMwZHFRVllLUW1kT1ZraFNSVVZFYWtGTloyZHdjbVJYU214amJUVnNaRWRXZWsxQk1FZERVM0ZIVTBsaU0wUlJSVUpEZDFWQlFUUkpRa0ZSUVhaelpVWmxiakpKYWdwRlRrSlFNWGROWW1Nck1qRnJZakp1WWxwUGJqRnVTMGh5SzNFNWJXcHNlSFoyVlRoNE1sZEZWWEZVYVdscVozTklXazE1VkhGbFozTnlTREo2U2pObkNqbE1MMDlLU1VwNGQwaHFlRUZKYkZGTk9XTTJhM2ROVDNCWVIwdHFLM0ZWVmswM1ZWVjRZWEExTmtaaFFUSkZWV2xVUVZsM2RFdE1lbUpsU2s1RlkzZ0tka1JRVkZveVdHczVVVVI2S3l0NU0yTk5LM296U201b09GSm9RblJCVnk5SFRFWlRTWE5CY2xKTVdYZDFURzR4U1ZWelIydHRZVUV6TkdKRWFuSjRSQW95U0ZaWE4yVTVaMlo1Y0ZGaFJHMHhOR1ZXUTBzcldXdDRlalF5UTBOb2RXRnJRbGQ0UnpRd2VucHBRMVZoTlVkV1ZXVk5lR1ZxU1dKMVNEQXdSbWs1Q214bFZURlhUMEZsVG1oRmIxaEJZM05EZW0xTU1XMDBNbWRaU0U0MVFsb3laRU15VEdKYVkwWnhNVzFHZEdoaFdtUnFWRWgyTWpKVlppOHpRM05TU0dVS2F6Vm9iMVJVZVZJd2JTdEZDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsKICAgIHNlcnZlcjogaHR0cHM6Ly8xMjguMjI0LjE1Ny4xMjk6NjQ0MwogIG5hbWU6IGNsdXN0ZXIubG9jYWwKY29udGV4dHM6Ci0gY29udGV4dDoKICAgIGNsdXN0ZXI6IGNsdXN0ZXIubG9jYWwKICAgIHVzZXI6IGt1YmVybmV0ZXMtYWRtaW4tY2x1c3Rlci5sb2NhbAogIG5hbWU6IGt1YmVybmV0ZXMtYWRtaW4tY2x1c3Rlci5sb2NhbEBjbHVzdGVyLmxvY2FsCmN1cnJlbnQtY29udGV4dDoga3ViZXJuZXRlcy1hZG1pbi1jbHVzdGVyLmxvY2FsQGNsdXN0ZXIubG9jYWwKa2luZDogQ29uZmlnCnByZWZlcmVuY2VzOiB7fQp1c2VyczoKLSBuYW1lOiBrdWJlcm5ldGVzLWFkbWluLWNsdXN0ZXIubG9jYWwKICB1c2VyOgogICAgY2xpZW50LWNlcnRpZmljYXRlLWRhdGE6IExTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVVJKVkVORFFXZHRaMEYzU1VKQlowbEpWVXQ1ZFdkeWIweFRTMGwzUkZGWlNrdHZXa2xvZG1OT1FWRkZURUpSUVhkR1ZFVlVUVUpGUjBFeFZVVUtRWGhOUzJFelZtbGFXRXAxV2xoU2JHTjZRV1ZHZHpCNVRrUkJNVTFVVFhoTmFsRXlUWHBLWVVaM01IbE9WRUV4VFZSTmVFMXFWWGhOZWs1aFRVUlJlQXBHZWtGV1FtZE9Wa0pCYjFSRWJrNDFZek5TYkdKVWNIUlpXRTR3V2xoS2VrMVNhM2RHZDFsRVZsRlJSRVY0UW5Ka1YwcHNZMjAxYkdSSFZucE1WMFpyQ21KWGJIVk5TVWxDU1dwQlRrSm5hM0ZvYTJsSE9YY3dRa0ZSUlVaQlFVOURRVkU0UVUxSlNVSkRaMHREUVZGRlFYSnZaVzAxYTFnM2JrTnJMMk4xU21vS2EzVXlhbEZyTlUxNU5WRXpNa0l4V2psYU5YWkZNVU0yVjJGUE5WUmFhekpEUXk5RU5YTm1PRWRwU2pWS1MyYzVXSG95UVVaelVWaFhjVlIzUmpsdGJ3cExVbXRWUW1SUU5tUk1OMVJzWkV3M00xWmpMMFpHV1U5MWJteG5kV1pCVm5aaGNqaG5XVW8xT0d4NVdESnpkbWMxWkdGeVltUTNhM3B1UWtkblUwTnBDa1E0VDJocWJ5ODRablpOVmxWMmVWWklSako0VjFoellrMDBXa2xtUlVGa1lqUnJjSEIzYnpCcE1XczRTVFkzWkZseFVYWjVVRkZ4Y1ROQlFYVm1SMW9LZVU5RlpHb3ZTVlZsVEhrMWJWWm5URmMwTkVOTGJpODRSMmhSUVVOcFZtWjRTRVU0U0U1dldsSjBUakpZUlVocFJXdHRMMFpuU2xsbWFGRndRelV2WkFwdFVFMUhOamgyTDBwa1VFeHVhVkpVTTJSTFVrbzNRMU5XTVhsek1tbFhTbTVFVUVWdVJIUTFlRnBDWldzdmIzZHJUa1pEUm1sa1NrODVTVlJ3UTNoRENsbHhSa04wVVVsRVFWRkJRbTh4V1hkV1JFRlBRbWRPVmtoUk9FSkJaamhGUWtGTlEwSmhRWGRGZDFsRVZsSXdiRUpCZDNkRFoxbEpTM2RaUWtKUlZVZ0tRWGRKZDBSQldVUldVakJVUVZGSUwwSkJTWGRCUkVGbVFtZE9Wa2hUVFVWSFJFRlhaMEpTVTBJMGJEWk9Xa0l5VEZaQ1dsVlRWbmRaY2poRFUyTjVTd3BIYWtGT1FtZHJjV2hyYVVjNWR6QkNRVkZ6UmtGQlQwTkJVVVZCYTB4bk9GSkplSFo2VG1WTlJXSlhUR3RETlRacVVIbG1XblpwYjI0NGEzcFZUa2RHQ2xCbVUyMXRUVFJxZURkSWNtaDViamhNTVVKWVJ6TnJZazFTZFdseVMwdHdUblJwY2pCNmNIZElOelptTHpsNWNsTlBlak5tTlc1MWRHSXdOUzlVYjBJS2IxTjFla1V3UmpoQ1VGUmtjM2xIVmpjdmNucDFVSE5wWjBaaWJXZGtNemhJV1ROTGRrWlliekpFZDIxcmRFOWhZMXBxZDNCMVJrSXZXVVZrVm5FNFdRcFJhWGd6TUROT09HZGpNMDR2VGpkVVdIVklNR3N4TTNkalRIcElhVWx6VFVScksyUlRabWh3TnpkUGNGZ3pVRlUwV2tkV1F6bFJlRWx4TkhwbmVqVjRDbGxLUTBkdFlreFBUVzR5YjBNd2FFZzNOelJvWVdScWJHY3ZURk5qZWpCelQzWXdTbU4yV1daeVdYcFpVa3RhZHpBMlRqVjJTWE5tTkdZdlQzWldUQzhLVHpKS1RISkhRV3BaZG1oblRYZEtORXRXV2t4RVV6bHlUMVZwUVRFNVNVOXRlSGQxTkRsV1EzVlFXWFY2VDIxM0sxRTlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09CiAgICBjbGllbnQta2V5LWRhdGE6IExTMHRMUzFDUlVkSlRpQlNVMEVnVUZKSlZrRlVSU0JMUlZrdExTMHRMUXBOU1VsRmNFRkpRa0ZCUzBOQlVVVkJjbTlsYlRWcldEZHVRMnN2WTNWS2FtdDFNbXBSYXpWTmVUVlJNekpDTVZvNVdqVjJSVEZETmxkaFR6VlVXbXN5Q2tOREwwUTFjMlk0UjJsS05VcExaemxZZWpKQlJuTlJXRmR4VkhkR09XMXZTMUpyVlVKa1VEWmtURGRVYkdSTU56TldZeTlHUmxsUGRXNXNaM1ZtUVZZS2RtRnlPR2RaU2pVNGJIbFlNbk4yWnpWa1lYSmlaRGRyZW01Q1IyZFRRMmxFT0U5b2FtOHZPR1oyVFZaVmRubFdTRVl5ZUZkWWMySk5ORnBKWmtWQlpBcGlOR3R3Y0hkdk1Ha3hhemhKTmpka1dYRlJkbmxRVVhGeE0wRkJkV1pIV25sUFJXUnFMMGxWWlV4NU5XMVdaMHhYTkRSRFMyNHZPRWRvVVVGRGFWWm1DbmhJUlRoSVRtOWFVblJPTWxoRlNHbEZhMjB2Um1kS1dXWm9VWEJETlM5a2JWQk5Selk0ZGk5S1pGQk1ibWxTVkROa1MxSktOME5UVmpGNWN6SnBWMG9LYmtSUVJXNUVkRFY0V2tKbGF5OXZkMnRPUmtOR2FXUktUemxKVkhCRGVFTlpjVVpEZEZGSlJFRlJRVUpCYjBsQ1FVTjRkeTlzTjBWcmVqRkJaelZsVGdwaWFUSk1kRmhoT0RKWVJUbFlUSEkzVUd4Nk9EWjFkbEZOY1U5QmRsUTJNVTVNTUVFM1RFWnVWM2h4VFdwTGVEUTJjV1pHTUZWbU5uaHlaV1ZMUlZSeENtUTFaQzlsTUc1QmIwcFlOWGRaWWpGSmJ6RkxSMmhZYW1zdmVVaDVPRzFPUTFCM2VTOW1hemhqUkVReWQzWlNSREZvUTNkcFVtRkNSekpKTVRGTU5ITUtkMUpsYVdsU1JEQlBVMlJoV0hGUGVrUlpWV0pzYmpGcGFUVnhhWFY1UjA1NFMzVnBiSGhHYVc1a1drUTRWekJEYTFOWWRtVlBWVVl5UzIwMldGSXlaQXB0VVRsT1ltUkZaREExZHpWclJVeExTVkowTjBzdldEaFpOMHhSV21oRlVXZzVaVEZUVTJrNFVHUnlURGQxYTNkNmJrOXNjR3A1TWk5S1QzWkhieXRUQ2xsaU9USlJabmxRT1RWTk1tWXdWM0V6Y0dFclRqZFVVWHAxUkRGUlpUaG9UVzFMYVdSTmNrczRibmhCVmxOQ2JGYzJVVGhPVlM5NGJqVjZSMko2Y0cwS1ZEZ3lUVGxCUlVObldVVkJlQ3Q1V1d0Uk0wNUtlbWh3TVhoWWNIZEdMMUU1TTJwQlZFbDFPRlZHZVdwd1pFNXdRemgzVEZrclRGQlhUa2xuVDA4eWR3b3dWRGQwWWtrMlpua3ZTalp5UzFVM1VXeHJkVUZZYnl0NFQwdGpVMkp3UlVaQ1REWkxNbTlEY0U5eFJYbDBjRTlQVm1sMVlYUkJiRGgzTUM5MVFrUldDakpVY1RsTmNGRTVWR3hHY3pjd01IUk1iblJUWWxCU2IxTjZSWGMyWTNobk1Vc3pTemQwWTNkek9EQTNjR013ZEZkaVluUlZka1ZEWjFsRlFUTXpkV29LUTA5NVRHNVlOSFowTmxkRUt6WkRNRGM1YVhwRU9XUm5iMlI1WlcxUFFUZHZURUp0TUM5WldteEViWFJRZWtaRVFtNTBkRXhCZVc1SFNuRnRZMWt2UlFwTVpuVm5LMlEwY1RCSWNXeGxaRFpsT0dkS2QxVkxSQzlGVjNObmMzVlNUSFYzZVdGQlRFdFNXR05tWWs0M1JEaGlNVXBvWlhvNGFIVktWVEp2VlVoUkNqQlBTVE52UW5GNWJFWlNSWEp1VEVOaFRDdFFXV2RuWmxaaFVVRm9aVVl6UWxaUlp6VkJWVU5uV1VKWGQwY3lOMnMzWlZBMk1GUlRSbWx2YlZabE1rSUtWbEkxYzIxTU5GRlRVVXRvT1VWcVF6STNiV1JyUlM5V1FrOXJRMmwyUjAwcmNtUm1kMk4yU2xobFEzQm9aRVptUTNZclVtMUtRV2ROZHpCTFYxRTRkQXBtYzJGaWFrSmhNWEJUV1ZkUFFVSXhiR1YxY0ZsalZERTBTM1pxYmxSeFQxWndVeXR0SzBNeVYxWk1hSHBEVm5NMVFYQjVVMDlRZDNKT2JrTjFaa3hUQ214ek9WZE5TRFZ5Y0hkVVdTOHhNVTFpY205M2IxRkxRbWRSUTBsT1FYZE1UbXM1YnpkNU1Gb3lhRUl3V0ZZcmNFSm5UWEl4YmtsWlpFTk9ZM1pPZW1FS1pFZG9XRXR3WjNkV1J6WlpTWFZtWTI1WlJFNDFaa0UwSzBwblZXZHFRbTlpWjBkUlFqWXhSVmhzZEZoNVUzaExRblExTkRWWldsQkZWMFpsV21aRldnb3dVRnBVUlc5SGVVUkZielI1VHpoM01GbzJSSGhPYUVOaVVEVmphbGxaT0hGSlMwdFhNM05ZUmpkNU9FeFZhamRIYWxSRE5VaDRhMkkwTWpaRGN6TkdDazgxTjBsSFVVdENaMUZEZVdOTmVHRkVPQzh6WlZSYVowODNVazR2UzFOTEwzcERUa0pSY21KV2FWY3pWVGRNWWpsVWFEVXJNRFZEVDFCRmIzYzFWbllLVmpaR1JHdGtXbTVzWTJSd1NUZHdUV3h1ZUM5VGJrZENaVzEyUzBkM2RXUjFkMHBHSzA1MlR6Uk5lV1poTldwaU56TlhlVUZTY2tKM1EwRkxNa2h1YmdvMWJYaDVTRTk1WVhBNFRuTkphekpTYnk4eFEwNU9Oa0poWjBJemRrVmlXRVpQZDBKU2IwSm5WakZZTlU5VFNYUklLMUZNTjNjOVBRb3RMUzB0TFVWT1JDQlNVMEVnVUZKSlZrRlVSU0JMUlZrdExTMHRMUW89Cg=="

function show_parameters {
    Write-Host "version_k8s is $version_k8s" -ForegroundColor Green
    Write-Host "version_calico is $version_calico" -ForegroundColor Green
    Write-Host "dns_server is $dns_server" -ForegroundColor Green
    Write-Host "cluster_cidr is $cluster_cidr" -ForegroundColor Green
}

function base64_decode {
    param(
        [string]$encode
    )
    
    $bytes = [Convert]::FromBase64String($encode)
    $decode = [System.Text.Encoding]::UTF8.GetString($bytes)
    return $decode
}

function set_kubeconfig {
    mkdir c:\k
    New-Item c:\k\config
    $kubeconfig_content_decode = base64_decode -encode $kubeconfig_content_encode
    Add-Content -Path "c:\k\config" -Value $kubeconfig_content_decode
}

function install_containerd {
    Invoke-WebRequest `
        -UseBasicParsing "https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-ContainerdRuntime/install-containerd-runtime.ps1" `
        -o install-containerd-runtime.ps1
    
    .\install-containerd-runtime.ps1
    
    $ENV:CNI_BIN_DIR="c:\program files\containerd\cni\bin"
    $ENV:CNI_CONF_DIR="c:\program files\containerd\cni\conf"
}

function install_calico {
    Invoke-WebRequest `
        -Uri https://github.com/projectcalico/calico/releases/download/$version_calico/install-calico-windows.ps1 `
        -OutFile install-calico-windows-$version_calico.ps1

    $script_name = "install-calico-windows-" + $version_calico + ".ps1"
    & .\$script_name `
        -ReleaseBaseURL "https://github.com/projectcalico/calico/releases/download/$version_calico" `
        -ReleaseFile "calico-windows-$version_calico.zip" `
        -KubeVersion "$version_k8s" `
        -DownloadOnly "yes" `
        -ServiceCidr "$cluster_cidr" `
        -DNSServerIPs "$dns_server"
    
    C:\CalicoWindows\install-calico.ps1
    C:\CalicoWindows\start-calico.ps1
    
}

function replace_vethernet {
    $script_kubelet = "C:\CalicoWindows\kubernetes\kubelet-service.ps1"
    $newValue = "vEthernet (*"
    $content = Get-Content -Path $script_kubelet 
    $newContent = $content -replace 'vEthernet \(Ethernet\*',"$newValue"
    Set-Content -Path $script_kubelet -Value $newContent
}

function install_kube {
    New-NetFirewallRule `
        -Name 'Kubelet-In-TCP' `
        -DisplayName 'Kubelet (node)' `
        -Enabled True `
        -Direction Inbound `
        -Protocol TCP `
        -Action Allow `
        -LocalPort 10250

    C:\CalicoWindows\kubernetes\install-kube-services.ps1
    replace_vethernet
    Start-Service kubelet
    Start-Service kube-proxy
}

show_parameters
set_kubeconfig
install_containerd
install_calico
install_kube