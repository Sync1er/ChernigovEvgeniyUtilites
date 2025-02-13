start "Scan Folder Size" /D "%~dp0" powershell.exe "$compAdr="""%1"""; $a= Get-Content '.\%~nx0' -Encoding  BigEndianUnicode | Select-Object -Skip 3; Invoke-Expression ($a -join """`r`n""") #" EXIT /B#    https://github.com/Sync1er/ChernigovEugeniyUtilities#    https://habr.com/ru/users/Sync1er/#    Chernigov Eugeniy 2024. For non commercial use only  
  
  
 # F i x e d   e x c l u d e   s y m b o l i c   l i n k   f r o m   s c a n   d i r e c t o r i e s   a n d   f i l e s   ( R e p a r s e P o i n t )  
 # C h a n g e   s c r i p t   t o   s u p p o r t   f o r   o l d   P o w e r S h e l l   v e r s i o n s   o n   r e m o t e   P C ,   l i k e   W i n d o w s   7    
 # I n c r e a s e   s p e e d   u p   t o   5   t i m e s ,   c o u n t   s i z e   i n   l i v e   t i m e ,   c a n   c h a n g e   t r a s h o l d   w h i l e   s c a n    
  
 F u n c t i o n   P r o m p t   { $ h o s t . u i . R a w U I . W i n d o w T i t l e   =   $ ( g e t - l o c a t i o n ) ;   " : : " }  
 [ v o i d ]   [ S y s t e m . R e f l e c t i o n . A s s e m b l y ] : : L o a d W i t h P a r t i a l N a m e ( " S y s t e m . W i n d o w s . F o r m s " )  
 A d d - T y p e   - N a m e   W i n d o w   - N a m e s p a c e   C o n s o l e   - M e m b e r D e f i n i t i o n   '  
 [ D l l I m p o r t ( " K e r n e l 3 2 . d l l " ) ]  
 p u b l i c   s t a t i c   e x t e r n   I n t P t r   G e t C o n s o l e W i n d o w ( ) ;  
 [ D l l I m p o r t ( " u s e r 3 2 . d l l " ) ]  
 p u b l i c   s t a t i c   e x t e r n   b o o l   S h o w W i n d o w ( I n t P t r   h W n d ,   I n t 3 2   n C m d S h o w ) ;  
 '  
  
 [ C o n s o l e . W i n d o w ] : : S h o w W i n d o w ( (   $ c o n s o l e P t r   =   [ C o n s o l e . W i n d o w ] : : G e t C o n s o l e W i n d o w ( ) ) ,   0 )  
  
  
 i f ( - n o t   $ c o m p A d r ) { $ c o m p A d r = $ e n v : C O M P U T E R N A M E }  
 $ d i r = ' C : \ U s e r s '  
 $ e x l d =   ' C : \ U s e r s ;   C : \ W i n d o w s '  
 $ p h t L s t = ' C : \ ; C : \ U s e r s ; C : \ W i n d o w s ; D : \ ; E : \ ; F : \ ; G : \ '   - s p l i t   ' ; '  
 $ h e l p = "  
  
       S c a n   d i r e c t o r i e s   a n d   s h o w   e a c h   b i g g e r   t h a n   t h r e s h o l d   s i z e  
  
                                          
   _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _     _ _       _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _     _ _   _ _ _ _ _ _ _         _ _ _ _ _ _                
  %                              %#�%  % i%    % C : \ U s e r s                                          %#�%  %#�%         2 5 6% M B  % S t a r t%    
   � � � � � � � � � � � � � � � � � �     � �       � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     � �   � � � � � � �         � � � � � �  
       C o m p u t e r   n a m e         I n f o             P a t h   t o   s c a n   d i r e c t o r y                   T h r e s h o l d  
                                                                                                                               s i z e  
  
  
  
  
                                                                                                                     S h o w / h i d e  
                                                                                                           " " P e r m i s s i o n   D e n i e d " "  
                         E x c l u d e   p a t h   o r   f o l d e r   n a m e                                         e r r o r s  
                     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _              
   E x c l u d e :% C : \ U s e r s ;   C : \ W i n d o w s ;   * f o o * b a r *              %                &     S h o w  
                     � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �                         e r r o r s  
  
  
  
  
   D o n ' t   f o r g e t   t o   r u n   a s   a d m i n i s t r a t o r   f o r   s c a n n i n g   l o c a l   c o m p u t e r  
  
  
  
  
  
       A u t h o r   i s   n o t   l i a b l e   f o r   a n y   l o s s   o r   c l a i m  
  
  
       h t t p s : / / g i t h u b . c o m / S y n c 1 e r / C h e r n i g o v E u g e n i y U t i l i t i e s  
       h t t p s : / / h a b r . c o m / r u / u s e r s / S y n c 1 e r /  
       C h e r n i g o v   E u g e n i y   2 0 2 5   v e r 2 . 0    
  
       F o r   n o n   c o m m e r c i a l   u s e   o n l y  
  
       1 5 . 0 1 . 2 0 2 5  
  
                                                                                                         "  
 f u n c t i o n   W i l d   ( $ i n ) { [ w i l d c a r d p a t t e r n ] : : E s c a p e ( $ i n ) }  
  
 f u n c t i o n   C o u n t   {  
     $ f l d r s S Z =   @ ( )   +   $ g l o b a l : f l d r s S Z ;   $ l s t f l = ' / '  
     $ a = ' ' ;   $ f l =   $ ( $ f l d r s S Z . f l d r   |   % {   $ _   - s p l i t   " \ \ "   |   % { i f ( $ _ ) { $ a + = " $ _ \ " ;   $ a } } ;   $ a = ' ' } )   |   S o r t - O b j e c t   - U n i q u e   |   ? { $ _   - n o t i n   $ f l d r s S Z . f l d r }    
     i f ( $ f l ) { $ f l d r s S Z + = $ f l   |   % { [ P S C u s t o m O b j e c t ] @ { f l d r = $ _ ;   s z = [ U I n t 6 4 ] 0 ;   e r r =   ' ' } } }  
     $ f l d r s S Z =   $ f l d r s S Z   |   S o r t - O b j e c t   { $ _ . f l d r   - r e p l a c e   " \ \ " , ' 	 ' }  
     $ s z o u t = { $ c l r = ' N a v y ' ;   i f ( $ l s t s z   - g e   $ t r h l d * 1 0 ) { $ c l r = ' D a r k M a g e n t a ' } ;   i f ( $ l s t s z   - g e   $ t r h l d * 4 0 ) { $ c l r = ' B r o w n ' } ;   O u t p u t   " [ $ ( " { 0 : n 0 } "   - f   $ l s t s z + " M B " ) ] "   $ c l r   $ f o n t B o l d ;   $ l s t s z = 0 }  
     $ s h E r r =   { $ e r r = @ ( ) } ;   i f ( $ C h e c k B o x 1 . C h e c k e d ) { $ s h E r r =   { i f ( $ l s t s z   - g t   0 ) { . $ s z o u t } ;   $ l s t f l = ' / ' ;   $ e r r   |   % { O u t p u t   " ` n $ ( $ f l d r s S Z [ $ _ ] . f l d r   - r e p l a c e   " \ \ $ " ) " ;   O u t p u t   " [ $ ( $ f l d r s S Z [ $ _ ] . e r r ) ] "   ' r e d ' } ;   $ e r r = @ ( ) } }  
     $ i n i t =   { $ s t r t F l d r = " $ ( W i l d   $ f l d r s S Z [ $ c n ] . f l d r ) * " ;   $ s t r t = $ c n ;   $ e r r = @ ( ) }  
     $ c n = 0 ;   . $ i n i t  
     w h i l e ( $ c n   - l t   $ f l d r s S Z . C o u n t ) {  
         i f ( $ f l d r s S Z [ $ c n ] . e r r   - n e   ' ' ) { $ e r r + =   $ c n }  
         i f ( $ f l d r s S Z [ $ c n + 1 ] . f l d r   - l i k e   $ s t r t F l d r   ) { $ c n + + ;   c o n t i n u e }  
         $ a = [ i n t ] ( ( $ f l d r s S Z [ $ s t r t . . $ c n ] . s z   |   M e a s u r e - O b j e c t   - S u m ) . S u m   / 1 M B )  
         i f ( $ l s t s z ) { i f ( $ l s t s z   - n e   $ a   - o r   $ ( $ l s t s z   - a n d   $ s t r t F l d r   - n o t l i k e   " $ ( W i l d   $ l s t f l ) * " ) ) { . $ s z o u t } }  
         i f ( $ a   - g t   $ t r h l d ) {  
             i f ( $ f l d r s S Z [ $ s t r t ] . f l d r   - l i k e   " $ ( W i l d   $ l s t f l ) * " ) { $ p t h =   ' \ '   +   $ ( $ f l d r s S Z [ $ s t r t ] . f l d r . S u b s t r i n g ( $ l s t f l . L e n g t h ) )   - r e p l a c e   " \ \ $ " } e l s e { $ p t h =   " ` n $ ( $ f l d r s S Z [ $ s t r t ] . f l d r ) "   - r e p l a c e   " \ \ $ " }  
             O u t p u t   $ p t h ;   $ l s t s z =   $ a   ;   $ l s t f l =   $ f l d r s S Z [ $ s t r t ] . f l d r ;   $ c n = $ s t r t + 1 ;   . $ i n i t  
         } e l s e { $ c n + + ;   i f ( $ e r r ) { . $ s h E r r } ;   . $ i n i t }  
     }  
     i f ( $ l s t s z   - g t   0 ) { . $ s z o u t }  
     O u t p u t   " ` n ` n "  
 }  
  
 f u n c t i o n   O u t p u t ( $ t x t = " ` r ` n " ,   $ c o l o r = " b l a c k " ,   $ f o n t = $ f o n t ) {  
  
     $ s t a r t = $ L i s t B o x 3 s h d w . T e x t L e n g t h  
     $ L i s t B o x 3 s h d w . A p p e n d T e x t ( $ t x t )  
     $ L i s t B o x 3 s h d w . S e l e c t i o n S t a r t   =   $ s t a r t  
     $ L i s t B o x 3 s h d w . S e l e c t i o n L e n g t h   =   $ t x t . L e n g t h  
     $ L i s t B o x 3 s h d w . S e l e c t i o n F o n t   =   $ f o n t  
     $ L i s t B o x 3 s h d w . S e l e c t i o n C o l o r   =   $ c o l o r  
     $ s t a r t = $ L i s t B o x 3 s h d w . T e x t L e n g t h  
     $ L i s t B o x 3 s h d w . A p p e n d T e x t ( ' ' )  
     $ L i s t B o x 3 s h d w . S e l e c t i o n L e n g t h   =   0  
     $ L i s t B o x 3 s h d w . S e l e c t i o n C o l o r   =   ' B l a c k '  
 #     W r i t e - H o s t   $ t x t   - n  
 }  
 $ g l o b a l : o u t = @ ( )  
 i f ( $ t i m e r ) { $ t i m e r . D i s p o s e ( ) }  
 $ g l o b a l : r t f = $ f a l s e  
 $ t i m e r   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . T i m e r  
 $ t i m e r . I n t e r v a l   =   1 0 0 0  
 $ t i m e r . a d d _ t i c k ( {  
     $ t m p =     @ ( )  
     G e t - J o b   |   R e c e i v e - J o b   - E r r o r V a r i a b l e   e r r   - W a r n i n g A c t i o n   S i l e n t l y C o n t i n u e   - W a r n i n g V a r i a b l e   t m p   * > $ n u l l  
     G e t - J o b   |   W h e r e   { $ _ . S t a t e   - e q   ' C o m p l e t e d ' }   |   R e m o v e - J o b   - f o r c e  
     i f ( $ t m p ) {  
         $ L i s t B o x 3 s h d w . R t f =   $ r t f  
         $ g l o b a l : a l l S Z + = $ t m p  
         $ l s t = $ f l d r s S Z . C o u n t  
         $ g l o b a l : f l d r s S Z + =   $ ( $ t m p   |   % {  
             $ a =   $ _   - s p l i t   ' \ * '  
             i f ( $ a . C o u n t   - e q   2 ) { O u t p u t   $ a [ 0 ]   $ a [ 1 ] } e l s e { [ P S C u s t o m O b j e c t ] @ { f l d r = $ a [ 2 ] ;   s z = [ U I n t 6 4 ] $ a [ 3 ] ;   e r r =   $ a [ 4 ] } }  
         } )  
         $ g l o b a l : r t f =   $ L i s t B o x 3 s h d w . R t f ;  
         i f ( $ l s t   - n e   $ f l d r s S Z . C o u n t ) { C o u n t }  
         $ s c r l =   $ L i s t B o x 3 s h d w . T e x t . L e n g t h  
         $ a 1 =   $ L i s t B o x 3 . S e l e c t i o n S t a r t  
         $ a 2 =   $ L i s t B o x 3 . S e l e c t i o n L e n g t h  
         $ L i s t B o x 3 . R t f =   $ L i s t B o x 3 s h d w . R t f  
         $ L i s t B o x 3 . S e l e c t i o n S t a r t =   $ s c r l  
         $ L i s t B o x 3 . S e l e c t i o n S t a r t =   $ a 1  
         $ L i s t B o x 3 . S e l e c t i o n L e n g t h =   $ a 2  
         $ L i s t B o x 3 . S c r o l l T o C a r e t  
     }  
     i f ( - n o t ( G e t - J o b ) ) { $ L i s t B o x 3 . A p p e n d T e x t ( " ` n ` n   - =   D o n e   = - ` n ` n " ) ;   S c a n B u t t o n   { S c a n }   ' S t a r t ' ;   ;     i f ( $ g l o b a l : w r m   - e q   ' S t o p p e d ' ) { G e t - S e r v i c e   - N a m e   W i n R M   - C o m p u t e r N a m e   $ c o m p A d r   |     S t o p - s e r v i c e } ;   $ g l o b a l : w r m = $ n u l l ;   $ t i m e r . S t o p ( )   }  
 } )  
  
  
 f u n c t i o n   R e C o u n t   {  
     $ a =   [ i n t ] ( $ L i s t B o x 1 1 . T e x t )  
     i f ( $ a   - g t   0   - a n d   $ a   - n e   $ t r h l d ) {  
         $ g l o b a l : f l d r s = @ ( )  
         $ L i s t B o x 3 s h d w . T e x t = ' '  
         $ g l o b a l : t r h l d =   $ a ;   $ t r h l d =   $ a  
         $ g l o b a l : f l d r s S Z =   $ g l o b a l : a l l S Z   |   % {  
             $ a =   $ _   - s p l i t   ' \ * '  
             i f ( $ a . C o u n t   - e q   2 ) { O u t p u t   $ a [ 0 ]   $ a [ 1 ] } e l s e { [ P S C u s t o m O b j e c t ] @ { f l d r = $ a [ 2 ] ;   s z = [ U I n t 6 4 ] $ a [ 3 ] ;   e r r =   $ a [ 4 ] ;   C n t = [ B o o l e a n ] [ I n t ] $ a [ 5 ] } }  
         }  
         $ g l o b a l : r t f =   $ L i s t B o x 3 s h d w . R t f ;  
         C o u n t  
         $ L i s t B o x 3 . R t f =   $ L i s t B o x 3 s h d w . R t f  
     }  
 }  
  
 f u n c t i o n   S t o p   {   R m v S l c t n ;   $ L i s t B o x 3 . A p p e n d T e x t ( " ` n ` n   S c a n   a b o r t e d !   ` n ` n " ) ;   G e t - J o b   |   R e m o v e - J o b   - F o r c e ;   $ g l o b a l : f l d r s S Z = @ ( ) ;   S c a n B u t t o n   { S c a n }   ' S t a r t ' ;     i f ( $ g l o b a l : w r m   - e q   ' S t o p p e d ' ) { G e t - S e r v i c e   - N a m e   W i n R M   - C o m p u t e r N a m e   $ c o m p A d r   |     S t o p - s e r v i c e } ;   $ g l o b a l : w r m = $ n u l l }  
  
 f u n c t i o n   I n f o   {  
     G e t - J o b   |   R e m o v e - J o b   - F o r c e  
     U p d L i s t ;   O u t p u t   " ` n ` n "  
     i f ( $ t i m e r ) { $ t i m e r . D i s p o s e ( ) }  
     $ L i s t B o x 3 . T e x t = ' '  
     R m v S l c t n  
     $ L i s t B o x 3 s h d w . T e x t = ' '  
     $ g l o b a l : c o m p A d r =   ( $ L i s t B o x . T e x t ) . t r i m ( )  
     $ h s t = $ ( ( G e t - W m i O b j e c t   - C l a s s   C I M _ C o m p u t e r S y s t e m   - C o m p u t e r N a m e   $ c o m p A d r   - E r r o r V a r i a b l e   e r r ) . n a m e )   2 > $ n u l l  
     i f ( $ e r r ) { O u t p u t   $ ( " ` n ` n $ c o m p A d r "   +   " :   " ) ;   O u t p u t   $ ( $ e r r . M e s s a g e )   ' r e d ' ;   r e t u r n }  
             O u t p u t   " ` n   H o s t   n a m e   -   $ h s t ` n "  
  
             $ a = G e t - W m i O b j e c t   w i n 3 2 _ l o g i c a l d i s k   - C o m p u t e r N a m e   $ c o m p A d r   |   s e l e c t   D e v i c e I D ,   F r e e S p a c e ,   S i z e ,   V o l u m e N a m e   |   W h e r e   { $ _ . S i z e }    
             i f ( $ a ) {  
                 O u t p u t   " ` n � D r i v e � � � � S i z e � � F r e e S p a c e � � � � U s a g e � � � V o l u m e � N a m e ` n - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ` n "  
                 $ a   |   F o r E a c h   {  
                     $ f r e e = $ ( $ ( 1 0 0 - [ i n t ] ( 1 0 0 * ( $ _ . F r e e S p a c e � / � $ _ . S i z e ) ) ) ) ;   $ c l r = " D a r k G r e e n " ;   i f ( $ f r e e   - g e   8 0 ) { $ c l r = " C h o c o l a t e " } ;   i f ( $ f r e e   - g e   9 0 ) { $ c l r = " C r i m s o n " }  
  
                     O u t p u t   " � � $ ( $ _ . D e v i c e I D . P a d R i g h t ( 3 , " � " ) ) � $ ( " $ ( [ i n t ] ( $ _ . S i z e � / � 1 G B ) ) G B " . P a d L e f t ( 8 , " � " ) )   $ ( " $ ( [ i n t ] ( $ _ . F r e e S p a c e � / � 1 G B ) ) G B " . P a d L e f t ( 1 0 , " � " ) ) " ;   O u t p u t   " � $ ( " $ f r e e % " . P a d L e f t ( 8 , " � " ) ) "   $ c l r ;   O u t p u t   " � � � $ ( $ _ . V o l u m e N a m e ) ` n "  
                 }  
                 O u t p u t   " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ` n "  
             }  
             O u t p u t   " ` n ` n   - =   D o n e   = - ` n ` n " ;   S c a n B u t t o n   { S c a n }   ' S t a r t '  
             $ L i s t B o x 3 . R t f =   $ L i s t B o x 3 s h d w . R t f  
 }  
  
 f u n c t i o n   U p d L i s t   {  
     $ a = @ ( ) ;   $ a + = $ L i s t B o x . t e x t ;   $ L i s t B o x . I t e m s   |   S o r t - O b j e c t   - U n i q u e   |   F o r E a c h - O b j e c t   { i f (   $ a   - n o t c o n t a i n s   $ _   ) { $ a + = $ _ } } ;  
     $ L i s t B o x . I t e m s . c l e a r ( ) ;   $ a   |   F o r E a c h - O b j e c t   { $ L i s t B o x . I t e m s . A d d ( " $ _ " ) }  
  
     $ a = @ ( ) ;   $ a + = $ L i s t B o x 1 . t e x t ;   $ L i s t B o x 1 . I t e m s   |   S o r t - O b j e c t   - U n i q u e   |   F o r E a c h - O b j e c t   { i f (   $ a   - n o t c o n t a i n s   $ _   ) { $ a + = $ _ } } ;  
     $ L i s t B o x 1 . I t e m s . c l e a r ( ) ;   $ a   |   F o r E a c h - O b j e c t   { $ L i s t B o x 1 . I t e m s . A d d ( " $ _ " ) }  
 }  
  
  
 f u n c t i o n   S c a n   {  
     $ g l o b a l : a l l S Z = @ ( ) ; $ g l o b a l : a l l T m p =   @ ( )  
     $ g l o b a l : r t f = $ f a l s e  
     $ g l o b a l : f l d r s S Z = @ ( )  
     $ g l o b a l : f l d r s = @ ( )  
     $ L i s t B o x 3 s h d w . T e x t = ' '  
     G e t - J o b   |   R e m o v e - J o b   - F o r c e  
     i f ( $ t i m e r ) { $ t i m e r . D i s p o s e ( ) }  
     U p d L i s t  
     S c a n B u t t o n   { S t o p }   ' S t o p '  
     $ L i s t B o x 3 . T e x t = ' '  
     R m v S l c t n    
     $ g l o b a l : c o m p A d r =   ( $ L i s t B o x . T e x t ) . t r i m ( )  
     $ d i r = ( $ L i s t B o x 1 . T e x t ) . t r i m ( )  
     i f ( $ d i r   - l i k e   " \ \ ? * " ) { $ g l o b a l : c o m p A d r = $ e n v : C O M P U T E R N A M E }  
     $ t r h l d =   2 5 6 ;   i f ( [ i n t ] ( $ L i s t B o x 1 1 . T e x t )   - g t   1 ) { $ t r h l d =   [ i n t ] ( $ L i s t B o x 1 1 . T e x t ) } ; $ L i s t B o x 1 1 . T e x t =   " $ t r h l d " ;   $ g l o b a l : t r h l d =   $ t r h l d  
     $ e x l d = ( ( $ L i s t B o x 2 . T e x t   - s p l i t   " ; " ) . t r i m ( )   |   W h e r e   { $ _ } )   - j o i n   ' ; '  
     i f ( $ g l o b a l : c o m p A d r   - n e   $ e n v : C O M P U T E R N A M E ) {  
         $ g l o b a l : w r m = ( G e t - S e r v i c e   - N a m e   W i n R M   - C o m p u t e r N a m e   $ c o m p A d r ) . S t a t u s  
         i f ( $ g l o b a l : w r m   - e q   ' S t o p p e d ' ) { G e t - S e r v i c e   - N a m e   W i n R M   - C o m p u t e r N a m e   $ c o m p A d r   |     S t a r t - s e r v i c e }  
     }  
  
     S t a r t - J o b   - I n p u t O b j e c t   " $ c o m p A d r ; $ d i r ; $ e x l d "   - N a m e   ' S c a n '   - S c r i p t B l o c k   {  
         $ a = " $ i n p u t "   - s p l i t   ' ; ' ;   $ i n p u t = $ n u l l  
         $ c o m p A d r = $ a [ 0 ]  
         $ d i r = $ a [ 1 ]  
         $ e x l d = $ a [ 2 . . $ ( $ a . c o u n t   - 1 ) ]  
         $ a = $ n u l l  
  
         $ S c r i p t B l o c k   =   {  
             $ a = " $ i n p u t "   - s p l i t   ' ; '  
             $ V e r b o s e P r e f e r e n c e   =   " C o n t i n u e "  
             i f ( $ a ) {  
                 $ c o m p A d r = $ a [ 0 ]  
                 $ d i r = $ a [ 1 ]  
                 $ e x l d = $ a [ 2 . . $ ( $ a . c o u n t   - 1 ) ]  
             }  
  
             f u n c t i o n   t x t   ( $ t x t ,   $ c l r = ' B l a c k ' ) { W r i t e - W a r n i n g   - M e s s a g e   " $ t x t * $ c l r " }    
  
             $ g l o b a l : e r r s = @ ( )  
             t x t   " ` n   H o s t   n a m e   -   " ;   t x t   " $ e n v : C O M P U T E R N A M E ` n "  
             i f ( $ d i r   - n o t l i k e   " \ \ ? * " ) {  
                 $ a =   G e t - W m i O b j e c t   w i n 3 2 _ l o g i c a l d i s k   |   s e l e c t   D e v i c e I D ,   F r e e S p a c e ,   S i z e ,   V o l u m e N a m e   |   W h e r e   { $ _ . S i z e }    
                 i f ( $ a ) {  
                     t x t   " ` n � D r i v e � � � � S i z e � � F r e e S p a c e � � � � U s a g e � � � V o l u m e � N a m e ` n - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ` n "  
                     $ a   |   F o r E a c h   {  
                         $ f r e e = $ ( $ ( 1 0 0 - [ i n t ] ( 1 0 0 * ( $ _ . F r e e S p a c e � / � $ _ . S i z e ) ) ) ) ;   $ c l r = " D a r k G r e e n " ;   i f ( $ f r e e   - g e   8 0 ) { $ c l r = " C h o c o l a t e " } ;   i f ( $ f r e e   - g e   9 0 ) { $ c l r = " C r i m s o n " }  
                         t x t   " � � $ ( $ _ . D e v i c e I D . P a d R i g h t ( 3 , " � " ) ) � $ ( " $ ( [ i n t ] ( $ _ . S i z e � / � 1 G B ) ) G B " . P a d L e f t ( 8 , " � " ) )   $ ( " $ ( [ i n t ] ( $ _ . F r e e S p a c e � / � 1 G B ) ) G B " . P a d L e f t ( 1 0 , " � " ) ) " ;   t x t   " � $ ( " $ f r e e % " . P a d L e f t ( 8 , " � " ) ) "   $ c l r ;   t x t   " � � � $ ( $ _ . V o l u m e N a m e ) ` n "  
                     }  
                     t x t   " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ` n "  
                 }  
             }  
             t x t   " ` n   R o o t   d i r e c t o r y   -   $ d i r ` n ` n "  
  
             f u n c t i o n   W i l d   ( $ i n ) { [ w i l d c a r d p a t t e r n ] : : E s c a p e ( $ i n )     - r e p l a c e   ' ` \ * ' , ' * ' }  
             f u n c t i o n   E x l d   ( $ d i r ) { $ e x l d   |   % { i f ( $ d i r   - l i k e   $ ( W i l d   $ _ ) ) { $ t r u e ;   r e t u r n } } }  
  
             $ G e t D i r = { $ ( G e t - C h i l d I t e m   - P a t h   $ d i r   - F o r c e   |   W h e r e   { - n o t   $ ( E x l d   $ _ . F u l l N a m e ) }   |   s e l e c t   F u l l N a m e ,   A t t r i b u t e s )   |   W h e r e - O b j e c t   { $ _ . A t t r i b u t e s   - l i k e   " * D i r e c t o r y * "   - a n d   $ _ . A t t r i b u t e s   - n o t l i k e   " * R e p a r s e P o i n t * " }   |   F o r E a c h - O b j e c t   { $ _ . F u l l N a m e }   |   S o r t - O b j e c t   }  
             $ G e t F i l e = {  
                 $ e r r =   ' ' ;   $ s u m = [ s t r i n g ] ( $ ( G e t - C h i l d I t e m   - P a t h   $ d i r   - F o r c e   - E r r o r V a r i a b l e   e r r   |   s e l e c t   A t t r i b u t e s ,   L e n g t h   |   ? { $ _ . L e n g t h   - g t   1 } )   |   W h e r e - O b j e c t   {   $ _ . A t t r i b u t e s   - n o t l i k e   " * R e p a r s e P o i n t * " }   |   F o r E a c h - O b j e c t   { $ _ . L e n g t h }   |   M e a s u r e - O b j e c t     - S u m ) . S u m  
                 i f ( $ e r r ) { $ e r r =   [ s t r i n g ] $ ( $ e r r   |   F o r E a c h - O b j e c t   { ' ' + $ _ . C a t e g o r y I n f o . C a t e g o r y } ) ; $ g l o b a l : f l d r s T M P + = [ P S C u s t o m O b j e c t ] @ { d i r = $ d i r ;   s z = 0 ;   e r r =   $ e r r } }  
                 [ P S C u s t o m O b j e c t ] @ { d i r = $ d i r ;   s z = [ U I n t 6 4 ] $ s u m ;   e r r = ' ' }  
             }  
  
             f u n c t i o n     C h k F l d r   ( $ d i r ) {    
                 $ c u r D i r =   . $ G e t F i l e    
                 $ t m p = @ ( ) ;   $ t m p =   $ ( . $ G e t D i r   |   F o r E a c h - O b j e c t   { C h k F l d r   $ _ } )  
                 i f ( $ t m p ) {   $ a = [ U I n t 6 4 ] ( ( $ t m p . s z   |   M e a s u r e - O b j e c t     - S u m ) . S u m ) ;   $ c u r D i r . s z =   [ U I n t 6 4 ] $ c u r D i r . s z +   [ U I n t 6 4 ] $ a }  
                 i f ( 3 2 M B   - l t   $ c u r D i r . s z ) { $ g l o b a l : f l d r s T M P + = $ c u r D i r } e l s e { $ c u r D i r }  
                 $ g l o b a l : f l d r s T M P   |   ? { $ _ }   |   % {   W r i t e - W a r n i n g   - M e s s a g e   " * * $ ( $ _ . D i r ) \ * $ ( $ _ . s z ) * $ ( $ _ . e r r ) " } ;   $ g l o b a l : f l d r s T M P = @ ( ) ;  
             }  
             $ g l o b a l : f l d r s T M P = @ ( )  
  
             i f ( $ d i r   - l i k e   " \ \ ? * " ) {  
                 $ a = ( $ d i r   - r e p l a c e   ' \ \ \ \ '   - s p l i t   ' \ \ ' )  
                 i f ( $ a . c o u n t   - e q   1 ) { $ c m p = $ a [ 0 ] ;   $ s h r s = $ ( &   c m d . e x e   / c   " c h c p   6 5 0 0 1   > n u l   &   n e t   v i e w   \ \ $ c m p "   |   S e l e c t - S t r i n g   ' D i s k ' )   |   ? { $ _ }   |   % { " \ \ $ c m p \ "   +   ( $ _   - s p l i t   ' D i s k ' ) [ 0 ] . T r i m ( ) }   |   S o r t - O b j e c t  
                 } e l s e { $ s h r s   =   $ d i r }  
                 i f ( $ s h r s ) {   W r i t e - W a r n i n g   " * * \ \ $ ( $ a [ 0 ] ) \ * 0 * 0 " ;   $ s h r s   |   W h e r e   { - n o t   $ ( E x l d   $ _ ) }   |   F o r E a c h - O b j e c t   {   C h k F l d r   $ _   |   ? { $ _ }   |   % {   W r i t e - W a r n i n g   " * * $ ( $ _ . D i r ) \ * $ ( $ _ . s z ) * $ ( $ _ . e r r ) * 0 * " } } }  
             } e l s e {  
                 . $ G e t F i l e   |   ? { $ _ }   |   % {   W r i t e - W a r n i n g   " * * $ ( $ _ . D i r   - r e p l a c e   " \ \ $ " ) \ * $ ( $ _ . s z ) * $ ( $ _ . e r r ) " }  
                 . $ G e t D i r     |   F o r E a c h - O b j e c t   {   C h k F l d r   $ _   |   ? { $ _ }   |   % {   W r i t e - W a r n i n g   " * * $ ( $ _ . D i r ) \ * $ ( $ _ . s z ) * $ ( $ _ . e r r ) * 0 * " } }  
             }  
         }  
      
         i f ( $ e n v : C O M P U T E R N A M E   - e q   $ c o m p A d r ) { . $ S c r i p t B l o c k }  
         e l s e {   I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ c o m p A d r   - I n p u t O b j e c t   " $ t r h l d ; $ d i r ; $ ( $ e x l d   - j o i n   ' ; ' ) "   - E r r o r V a r i a b l e   e r r   - S c r i p t B l o c k   $ S c r i p t B l o c k }  
         i f ( $ e r r ) { t x t   " ` n ` n $ c o m p A d r   E r r o r :   " ;   t x t   " $ ( $ e r r . E x c e p t i o n . T r a n s p o r t M e s s a g e ) "   ' r e d ' }  
     }  
     $ t i m e r . S t a r t ( )  
 }  
  
  
 $ F o r m   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . F o r m  
 $ F o r m . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 6 8 7 , 8 2 6 )  
 $ F o r m . T e x t   = " S c a n   d i r e c t o r y   s i z e "  
 $ F o r m . M a x i m i z e B o x   =   $ t r u e  
 $ F o r m . M i n i m i z e B o x   =   $ t r u e  
 $ F o r m . S i z e G r i p S t y l e   =   [ S y s t e m . W i n d o w s . F o r m s . S i z e G r i p S t y l e ] : : H i d e  
 $ F o r m . B a c k C o l o r   =   " # c 0 c 0 c 0 "  
 $ F o r m . S h o w I c o n   =   $ t r u e  
 $ F o r m . W i n d o w S t a t e   =   " N o r m a l "  
 $ F o r m . O p a c i t y   =   1 . 0  
 $ F o r m . T o p M o s t   =   $ f a l s e  
  
 $ L i s t B o x   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . C o m b o B o x  
 $ L i s t B o x . L o c a t i o n   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 2 , 5 )  
 $ L i s t B o x . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 2 1 0 , 1 6 )  
 $ L i s t B o x . T e x t = $ c o m p A d r  
 $ L i s t B o x . F o n t   =   " C o u r i e r   N e w , 1 0 "  
 $ L i s t B o x . A l l o w D r o p   =   $ T r u e  
 $ L i s t B o x . A n c h o r = ' T o p , L e f t '  
 $ L i s t B o x . a d d _ S e l e c t e d I n d e x C h a n g e d ( { $ L i s t B o x . S e l e c t ( 0 , 0 ) ; $ L i s t B o x . f o c u s ( ) } )  
 $ F o r m . C o n t r o l s . A d d ( $ L i s t B o x )  
  
 $ L i s t B o x . I t e m s . C l e a r ( ) ;   $ c o m p A d r ,   $ e n v : C O M P U T E R N A M E   |   S o r t - O b j e c t   - U n i q u e   |   F o r E a c h   { $ L i s t B o x . I t e m s . A d d ( $ _ )   |   O u t - N u l l }  
  
 $ B u t t o n   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . B u t t o n  
 $ B u t t o n . L o c a t i o n   =   N e w - O b j e c t   S y s t e m . D r a w i n g . P o i n t (   2 1 5 , 7 )  
 $ B u t t o n . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 1 2 , 2 0 )  
 $ B u t t o n . T e x t   =   ' i '  
 $ B u t t o n . A d d _ C l i c k ( { I n f o } )  
 $ B u t t o n . A n c h o r = ' T o p , L e f t '  
 $ i B u t t o n = $ B u t t o n  
 $ f o r m . C o n t r o l s . A d d ( $ i B u t t o n )  
  
 $ L i s t B o x 1   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . C o m b o B o x  
 $ L i s t B o x 1 . L o c a t i o n   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 2 3 0 , 5 )  
 $ L i s t B o x 1 . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 2 6 0 , 1 6 )  
 $ L i s t B o x 1 . T e x t = $ d i r  
 $ L i s t B o x 1 . F o n t   =   " C o u r i e r   N e w , 1 0 "  
 $ L i s t B o x 1 . A l l o w D r o p   =   $ T r u e  
 $ L i s t B o x 1 . a d d _ S e l e c t e d I n d e x C h a n g e d ( { $ L i s t B o x 1 . S e l e c t ( 0 ,   0 ) ; $ L i s t B o x 1 . f o c u s ( ) } )  
 $ L i s t B o x 1 . A n c h o r = ' T o p , L e f t , R i g h t '  
 $ F o r m . C o n t r o l s . A d d ( $ L i s t B o x 1 )  
  
 $ L i s t B o x 1 . I t e m s . C l e a r ( ) ;   $ p h t L s t   |   F o r E a c h   { $ L i s t B o x 1 . I t e m s . A d d ( $ _ )   |   O u t - N u l l }  
  
 $ L i s t B o x 1 1   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . C o m b o B o x  
 $ L i s t B o x 1 1 . L o c a t i o n   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 5 0 0 , 5 )  
 $ L i s t B o x 1 1 . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 7 0 , 1 6 )  
 $ L i s t B o x 1 1 . T e x t = ' 2 5 6 '  
 $ L i s t B o x 1 1 . F o n t   =   " C o u r i e r   N e w , 1 0 "  
 $ L i s t B o x 1 1 . A l l o w D r o p   =   $ T r u e  
 $ L i s t B o x 1 1 . A n c h o r = ' T o p , R i g h t '  
 $ L i s t B o x 1 1 . a d d _ S e l e c t e d I n d e x C h a n g e d ( { $ L i s t B o x 1 1 . S e l e c t ( 0 ,   0 ) ; $ L i s t B o x 1 1 . f o c u s ( ) ;   R e C o u n t } )  
 $ L i s t B o x 1 1 . R i g h t T o L e f t   =   1  
 $ F o r m . C o n t r o l s . A d d ( $ L i s t B o x 1 1 )  
  
 $ L i s t B o x 1 1 . I t e m s . C l e a r ( ) ; $ a = 6 4 ;   0 . . 9 |   F o r E a c h   { $ L i s t B o x 1 1 . I t e m s . A d d ( " $ a " )   |   O u t - N u l l ;   $ a = $ a * 2 }  
  
 $ L a b e l 1 1   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . l a b e l  
 $ L a b e l 1 1 . L o c a t i o n   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 5 7 0 , 8 )  
 $ L a b e l 1 1 . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 3 0 , 2 0 )  
 $ L a b e l 1 1 . T e x t   =   ' M B '  
 $ L a b e l 1 1 . A n c h o r = ' T o p , R i g h t '  
 $ L a b e l 1 1 . F o n t   =   " A r i a l , 1 1 "  
 $ F o r m . C o n t r o l s . A d d ( $ L a b e l 1 1 )  
  
 $ c n t x t M e n u   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . C o n t e x t M e n u S t r i p  
 $ c n t x t M e n u . I t e m s . A d d ( " C o p y " ) . a d d _ C l i c k ( {   $ L i s t B o x 3 . C o p y ( )   } )  
  
 $ L i s t B o x 3   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . R i c h T e x t B o x  
 $ L i s t B o x 3 . L o c a t i o n   =   N e w - O b j e c t   S y s t e m . D r a w i n g . P o i n t ( 2 , 3 4 )  
 $ L i s t B o x 3 . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 6 6 5 , 7 1 6 )  
 $ L i s t B o x 3 . T e x t = $ h e l p  
 $ L i s t B o x 3 . M u l t i L i n e   =   $ T r u e  
 $ L i s t B o x 3 . D e t e c t U r l s   =   $ f a l s e  
 $ L i s t B o x 3 . F o n t   =   " C o u r i e r   N e w , 1 0 "  
 $ L i s t B o x 3 . R e a d O n l y   =   $ t r u e  
 $ L i s t B o x 3 . W o r d W r a p   =   $ F a l s e  
 $ L i s t B o x 3 . S c r o l l B a r s   =   " V e r t i c a l "  
 $ L i s t B o x 3 . R e a d O n l y   =   $ T r u e  
 $ L i s t B o x 3 . A l l o w D r o p   =   $ T r u e  
 $ L i s t B o x 3 . A n c h o r = ' T o p , L e f t , B o t t o m , R i g h t '  
 $ L i s t B o x 3 . C o n t e x t M e n u S t r i p   =   $ c n t x t M e n u  
 $ L i s t B o x 3 . S h o r t c u t s E n a b l e d   =   $ f a l s e  
  
 $ F o r m . C o n t r o l s . A d d ( $ L i s t B o x 3 )  
  
 $ L i s t B o x 3 s h d w   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . R i c h T e x t B o x  
 $ L i s t B o x 3 s h d w . M u l t i L i n e   =   $ T r u e  
 $ L i s t B o x 3 s h d w . D e t e c t U r l s   =   $ f a l s e  
 $ L i s t B o x 3 s h d w . F o n t   =   " C o u r i e r   N e w , 1 0 "  
 $ L i s t B o x 3 s h d w . R e a d O n l y   =   $ t r u e  
 $ L i s t B o x 3 s h d w . W o r d W r a p   =   $ F a l s e  
 $ L i s t B o x 3 s h d w . S c r o l l B a r s   =   " V e r t i c a l "  
 $ L i s t B o x 3 s h d w . R e a d O n l y   =   $ T r u e  
 $ L i s t B o x 3 s h d w . A l l o w D r o p   =   $ T r u e  
 $ L i s t B o x 3 s h d w . A n c h o r = ' T o p , L e f t , B o t t o m , R i g h t '  
 $ L i s t B o x 3 s h d w . S h o r t c u t s E n a b l e d   =   $ f a l s e  
  
 $ L a b e l   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . l a b e l  
 $ L a b e l . L o c a t i o n   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 6 , 7 5 8 )  
 $ L a b e l . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 6 7 , 2 0 )  
 $ L a b e l . T e x t   =   ' E x c l u d e : '  
 $ L a b e l . A n c h o r = ' B o t t o m , L e f t '  
 $ L a b e l . F o n t   =   N e w - O b j e c t   D r a w i n g . F o n t ( " T e r m i n a l " , 1 1 ,   [ D r a w i n g . F o n t S t y l e ] : : B o l d )  
 $ F o r m . C o n t r o l s . A d d ( $ L a b e l )  
  
 $ C h e c k B o x 1   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . C h e c k B o x  
 $ C h e c k B o x 1 . L o c a t i o n   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 6 0 5 , 7 4 8 )  
 $ C h e c k B o x 1 . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 5 5 , 4 0 )  
 $ C h e c k B o x 1 . T e x t   =   "   S h o w ` n   e r r o r s "  
 $ C h e c k B o x 1 . A n c h o r = ' B o t t o m , R i g h t '  
 $ C h e c k B o x 1 . C h e c k e d = 1  
 $ C h e c k B o x 1 . A d d _ C h e c k S t a t e C h a n g e d ( { $ t r h l d = 0 ;   R e C o u n t } )  
 $ F o r m . C o n t r o l s . A d d ( $ C h e c k B o x 1 )  
  
 $ L i s t B o x 2   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . T e x t B o x  
 $ L i s t B o x 2 . L o c a t i o n   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 7 5 , 7 5 6 )  
 $ L i s t B o x 2 . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 5 2 0 , 1 6 )  
 $ L i s t B o x 2 . T e x t =   $ e x l d  
 $ L i s t B o x 2 . F o n t   =   " C o u r i e r   N e w , 1 0 "  
 $ L i s t B o x 2 . W o r d W r a p   =   $ F a l s e  
 $ L i s t B o x 2 . A l l o w D r o p   =   $ T r u e  
 $ L i s t B o x 2 . A n c h o r = ' B o t t o m , L e f t , R i g h t '  
 $ F o r m . C o n t r o l s . A d d ( $ L i s t B o x 2 )  
  
 $ f o n t = $ L i s t B o x 3 . F o n t  
 $ f o n t B o l d   =   N e w - O b j e c t   D r a w i n g . F o n t ( $ f o n t . F o n t F a m i l y ,   $ f o n t . S i z e ,   [ D r a w i n g . F o n t S t y l e ] : : B o l d )  
  
 f u n c t i o n   R m v S l c t n   { $ i B u t t o n . f o c u s ( ) ;  
     $ L i s t B o x 1 1 . S e l e c t ( 1 0 , 0 ) ; $ L i s t B o x . S e l e c t ( 1 0 , 0 ) ;   $ L i s t B o x 1 . S e l e c t ( 1 0 , 0 ) ;   $ i B u t t o n . f o c u s ( )  
     $ L i s t B o x 1 . S e l e c t i o n L e n g t h = 0 ; $ L i s t B o x 1 1 . S e l e c t i o n L e n g t h = 0 ; $ L i s t B o x . S e l e c t i o n L e n g t h = 0  
 }  
  
 f u n c t i o n   S c a n B u t t o n   ( $ c l k , $ t x t )   {  
     $ B u t t o n   =   N e w - O b j e c t   S y s t e m . W i n d o w s . F o r m s . B u t t o n  
     $ B u t t o n . L o c a t i o n   =   N e w - O b j e c t   S y s t e m . D r a w i n g . P o i n t (   $ ( $ F o r m . S i z e . W i d t h   -   8 6 ) , 7 )  
     $ B u t t o n . S i z e   =   N e w - O b j e c t   S y s t e m . D r a w i n g . S i z e ( 6 0 , 2 0 )  
     $ B u t t o n . T e x t   =   $ t x t  
     $ B u t t o n . A d d _ C l i c k ( $ c l k )  
     $ B u t t o n . A n c h o r = ' T o p , R i g h t '  
     i f ( $ S c a n B u t t o n ) { $ g l o b a l : S c a n B u t t o n . D i s p o s e ( ) ;   $ g l o b a l : S c a n B u t t o n =   $ n u l l }  
     $ g l o b a l : S c a n B u t t o n = $ B u t t o n  
     $ g l o b a l : f o r m . C o n t r o l s . A d d ( $ g l o b a l : S c a n B u t t o n )  
     R m v S l c t n  
 }  
  
 S c a n B u t t o n   { S c a n }   ' S t a r t '  
  
 $ F o r m . A d d _ S h o w n ( { $ F o r m . A c t i v a t e ( ) ; R m v S l c t n } )  
  
 $ L i s t B o x . S e l e c t ( 0 ,   0 ) ;   $ L i s t B o x 1 . S e l e c t ( 0 ,   0 ) ;   $ L i s t B o x 1 1 . S e l e c t ( 0 ,   0 )  
  
 [ v o i d ]   $ F o r m . S h o w D i a l o g ( )  
  
 F u n c t i o n   S h   { [ v o i d ]   $ F o r m . S h o w D i a l o g ( ) }  
  
 [ C o n s o l e . W i n d o w ] : : S h o w W i n d o w ( (   $ c o n s o l e P t r   =   [ C o n s o l e . W i n d o w ] : : G e t C o n s o l e W i n d o w ( ) ) ,   4 )  
