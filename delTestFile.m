% function delete test file
function delTestFile(loop)
    even = mod(loop,2);
    if (even)
        delete C:\Users\Carlos\ImageSourceTest0\A\*.bmp ;
        delete C:\Users\Carlos\ImageSourceTest0\B\*.bmp ;
        delete C:\Users\Carlos\ImageSourceTest0\C\*.bmp ;  
        delete C:\Users\Carlos\ImageSourceTest0\D\*.bmp ;
    else
        delete C:\Users\Carlos\ImageSourceTest1\A\*.bmp ;
        delete C:\Users\Carlos\ImageSourceTest1\B\*.bmp ;
        delete C:\Users\Carlos\ImageSourceTest1\C\*.bmp ;       
        delete C:\Users\Carlos\ImageSourceTest1\D\*.bmp ;
    end
    



end
