let n = try int_of_string Sys.argv.(1) with _ -> 10

let rec fib t n =
  if n < 2
  then 1
  else
    let () = Printf.printf "Thread %d: %d" t n in
    let () = print_newline () in
    fib t (n - 1) + fib t (n - 2)

let main () =
  let d1 = Domain.spawn (fun _ -> fib 1 n) in
  let d2 = Domain.spawn (fun _ -> fib 2 n) in
  let r1 = Domain.join d1 in
  Printf.printf "fib(%d) = %d\n%!" n r1;
  let r2 = Domain.join d2 in
  Printf.printf "fib(%d) = %d\n%!" n r2

let _ = main ()
