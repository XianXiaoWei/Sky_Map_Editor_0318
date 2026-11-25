#pragma once
#ifdef SKY_WIN32_SURFACE
#include <atomic>
#include <cstdlib>

static HWND skyParentWindow(){const char* value=std::getenv("SKY_WIN32_PARENT");return value?reinterpret_cast<HWND>(uintptr_t(std::strtoull(value,nullptr,0))):nullptr;}
static bool skyHasParentWindow(){const auto parent=skyParentWindow();return parent&&IsWindow(parent);}
// The editor UI is an independent transparent Electron window above this
// child. HWND work has its own message thread; blocking binary input never
// stops Windows from processing resize, paint or destruction messages.
class SkyWin32Window {
    HANDLE ready{},thread{};std::atomic<HWND> handle{};HWND parent{};
    static LRESULT CALLBACK procedure(HWND window,UINT message,WPARAM w,LPARAM l){
        if(message==WM_PAINT){PAINTSTRUCT paint;BeginPaint(window,&paint);EndPaint(window,&paint);return 0;}
        if(message==WM_DESTROY){PostQuitMessage(0);return 0;}
        return DefWindowProcW(window,message,w,l);
    }
    static DWORD WINAPI entry(void* context){
        auto* owner=static_cast<SkyWin32Window*>(context);
        SetThreadDpiAwarenessContext(GetWindowDpiAwarenessContext(owner->parent));
        const auto instance=GetModuleHandleW(nullptr);WNDCLASSW type{};type.lpfnWndProc=procedure;type.hInstance=instance;type.lpszClassName=L"SkyEditorVulkanViewport";
        RegisterClassW(&type);
        auto window=CreateWindowExW(0,type.lpszClassName,L"",WS_CHILD|WS_CLIPSIBLINGS,0,0,1,1,owner->parent,nullptr,instance,nullptr);
        if(window)EnableWindow(window,FALSE);owner->handle.store(window);SetEvent(owner->ready);
        if(window){MSG message;while(GetMessageW(&message,nullptr,0,0)>0){TranslateMessage(&message);DispatchMessageW(&message);}}
        owner->handle.store(nullptr);UnregisterClassW(type.lpszClassName,instance);return 0;
    }
public:
    SkyWin32Window():parent(skyParentWindow()){
        if(!skyHasParentWindow())throw std::runtime_error("Windows viewport parent is unavailable");
        ready=CreateEventW(nullptr,TRUE,FALSE,nullptr);if(!ready)throw std::runtime_error("Windows viewport event creation failed");
        thread=CreateThread(nullptr,0,entry,this,0,nullptr);if(!thread){CloseHandle(ready);ready=nullptr;throw std::runtime_error("Windows viewport thread creation failed");}
        WaitForSingleObject(ready,INFINITE);
        if(!handle.load()){WaitForSingleObject(thread,INFINITE);CloseHandle(thread);CloseHandle(ready);thread=ready=nullptr;throw std::runtime_error("Windows viewport child creation failed");}
    }
    ~SkyWin32Window(){if(auto window=handle.load())PostMessageW(window,WM_CLOSE,0,0);if(thread){WaitForSingleObject(thread,INFINITE);CloseHandle(thread);}if(ready)CloseHandle(ready);}
    HWND window()const{const auto value=handle.load();return value&&IsWindow(value)?value:nullptr;}
    void bounds(int32_t x,int32_t y,uint32_t width,uint32_t height,bool visible){
        const auto value=window();if(!value)return;
        if(!SetWindowPos(value,nullptr,x,y,std::max(1u,width),std::max(1u,height),SWP_NOZORDER|SWP_NOACTIVATE|(visible&&width&&height?SWP_SHOWWINDOW:SWP_HIDEWINDOW)))throw std::runtime_error("Windows viewport resize failed");
    }
};
static SkyWin32Window& skyViewportWindow(){static SkyWin32Window value;return value;}
struct SkyWindowSnapshot { HWND handle{};uint64_t generation{}; };
static SkyWindowSnapshot skyAcquireWindow(){const auto value=skyViewportWindow().window();return {value,value?1u:2u};}
static void skyReleaseWindow(SkyWindowSnapshot& value){value={};}
static void skyUpdateViewport(int32_t x,int32_t y,uint32_t width,uint32_t height,bool visible){skyViewportWindow().bounds(x,y,width,height,visible);}
#endif
