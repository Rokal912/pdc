local script_version = "1.0.0"
local json_url = "https://raw.githubusercontent.com/USERNAME_KAMU/NAMA_REPO/main/version.json"

-- Variabel pendeteksi platform
local isAndroid = (getDeviceType ~= nil) -- Deteksi sederhana untuk Monetloader

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end

    -- Jalankan pengecekan update saat start
    checkUpdate()

    -- Deteksi IP Server
    local ip, port = sampGetCurrentServerAddress()
    
    if ip == "123.123.123.1" then -- Ganti dengan IP Server Pertama
        server_pertama_logic()
    elseif ip == "456.456.456.2" then -- Ganti dengan IP Server Kedua
        server_kedua_logic()
    else
        sampAddChatMessage("{FFFF00}[Script] {FFFFFF}Server tidak terdaftar di database.", -1)
    end

    wait(-1)
end

-- LOGIKA KHUSUS SERVER 1
function server_pertama_logic()
    sampAddChatMessage("{00FF00}[Script] {FFFFFF}Selamat datang di Server A!", -1)
    -- Masukkan fitur/cmd khusus server 1 di sini
end

-- LOGIKA KHUSUS SERVER 2
function server_kedua_logic()
    sampAddChatMessage("{00FF00}[Script] {FFFFFF}Selamat datang di Server B!", -1)
    -- Masukkan fitur/cmd khusus server 2 di sini
end

-- FUNGSI UPDATER
function checkUpdate()
    downloadUrlToFile(json_url, "ver_tmp.json", function(id, status, p1, p2)
        if status == 6 then
            local f = io.open("ver_tmp.json", "r")
            if f then
                local content = f:read("*a")
                f:close()
                os.remove("ver_tmp.json")
                -- Logika pembandingan versi bisa ditambah di sini menggunakan library JSON
            end
        end
    end)
end